import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/contact_us/contact_us_request_body.dart';
import '../../../data/repositories/contact_us_repo.dart';
import 'contact_us_state.dart';



class ContactUsCubit extends Cubit<ContactUsState> {
  final ContactUsRepo _contactUsRepo;

  ContactUsCubit(this._contactUsRepo) : super(const ContactUsState.initial());


  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final messageController = TextEditingController();

  final RegExp _egyptianPhoneRegExp = RegExp(r'^(010|011|012|015)[0-9]{8}$');
  final RegExp _nameRegExp = RegExp(r'^[\u0621-\u064A a-zA-Z]{2,}$'); // Arabic + English letters

  void submitForm()async {
    try {
      if (formKey.currentState!.validate()) {
        emit(const ContactUsState.loading());
        final response = await _contactUsRepo.submitMessage(
            ContactUsRequestBody(
                name: nameController.text,
                phone: phoneController.text,
                message: messageController.text
            )
        );

        response.when(
          success: (response) {
            formKey.currentState!.reset();
            emit(ContactUsState.success(response));
          },
          failure: (error) {
            emit(ContactUsState.error(
              message: error.getUserFriendlyMessage(),
            ));
          },
        );

      }
    }catch(e){
      emit(ContactUsState.error(
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
