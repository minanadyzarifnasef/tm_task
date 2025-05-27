import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../../data/models/complaints/complaint_types_response.dart';
import '../../../data/models/complaints/submit_complaint_request_body.dart';
import '../../../data/repositories/complaints_repo.dart';

import 'complaints_state.dart';



class ComplaintsCubit extends Cubit<ComplaintsState> {
  final ComplaintsRepo _complaintRepo;

  ComplaintsCubit(this._complaintRepo) : super(const ComplaintsState.initial()){
    getComplaintType();
  }


  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final detailsController = TextEditingController();

  final RegExp _egyptianPhoneRegExp = RegExp(r'^(010|011|012|015)[0-9]{8}$');
  final RegExp _nameRegExp = RegExp(r'^[\u0621-\u064A a-zA-Z]{2,}$');

  ComplaintTypesResponse? typesResponse;
  void getComplaintType()async {
    try {
      emit(const ComplaintsState.loadingTypes());
      final response = await _complaintRepo.getComplaintTypes();
      response.when(
        success: (response) {
          typesResponse=response;
          emit(const ComplaintsState.loaded());
        },
        failure: (error) {
          emit(ComplaintsState.error(
            message: error.getUserFriendlyMessage(),
          ));
        },
      );
    }catch(e){
      emit(ComplaintsState.error(
        message: e.toString(),
      ));
    }
  }

  ComplaintTypeModel? selectedComplaintType;
  selectType(ComplaintTypeModel type){
    emit(const ComplaintsState.loading());

    selectedComplaintType=type;
    emit(const ComplaintsState.loaded());
  }

  void submitComplaint()async {
    try {
      if (formKey.currentState!.validate()) {
        emit(const ComplaintsState.loading());
        final response = await _complaintRepo.submitComplaint(
            SubmitComplaintRequestBody(
                name: nameController.text,
                phone: phoneController.text,
                details: detailsController.text,
              complaintsId: selectedComplaintType?.id
            )
        );

        response.when(
          success: (response) {
            formKey.currentState!.reset();
            nameController.clear();
            phoneController.clear();
            detailsController.clear();
            selectedComplaintType=null;
            emit(ComplaintsState.success(response));
          },
          failure: (error) {
            emit(ComplaintsState.error(
              message: error.getUserFriendlyMessage(),
            ));
          },
        );

      }
    }catch(e){
      emit(ComplaintsState.error(
        message: e.toString(),
      ));
    }
  }
  validateName(value){
    {
      if (value == null || value.trim().isEmpty) {
        return  'name_empty_validation'.tr();
      } else if (!_nameRegExp.hasMatch(value.trim())) {
        return "name_error_validation".tr();
      }
      return null;
    }
  }
  validatePhone(value){

      if (value == null || value.trim().isEmpty) {
        return "phone_empty_validation".tr();
      } else if (!_egyptianPhoneRegExp.hasMatch(value.trim())) {
        return "phone_error_validation".tr();
      }
      return null;

  }
  validateMessage(value){
    {
      if (value == null || value.trim().isEmpty) {
        return "message_empty_validation".tr();
      }
    }
  }
}
