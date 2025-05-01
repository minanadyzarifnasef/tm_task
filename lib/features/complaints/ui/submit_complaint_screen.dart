
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamweelytask/core/helpers/navigate_extension.dart';
import 'package:tamweelytask/features/complaints/logic/complaints_cubit.dart';
import 'package:tamweelytask/features/complaints/logic/complaints_state.dart';


import '../../../core/constants/dimensions_constants.dart';
import '../../../core/routing/routes.dart';
import '../../../core/theming/widgets/appbar.dart';
import '../../../core/theming/widgets/bottom_sheet_button.dart';
import '../../../core/theming/widgets/bottom_sheet_list.dart';
import '../../../core/theming/widgets/go_button.dart';
import '../../../core/theming/widgets/text_input.dart';
class SubmitComplaintScreen extends StatelessWidget {
  const SubmitComplaintScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit=context.read<ComplaintsCubit>();
    return Scaffold(
      appBar: GradientAppBar(title: "submit_complaint".tr(),back: true,),
      body: Container(
        width: width.w,height: height.h,
        padding:EdgeInsets.all(edge),
        child: SingleChildScrollView(
          child: Form(
            key: cubit.formKey,
            child: Column(

              children: [

                TextInput(
                  controller: cubit.nameController,
                  validatorFun: (value)=>cubit.validateName(value),
                  title: "name".tr(),
                ),
                SizedBox(height: edge*0.5,),
                TextInput(
                  controller: cubit.phoneController,
                  validatorFun: (value)=>cubit.validatePhone(value),
                  title: "phone".tr(),
                ),
                SizedBox(height: edge*0.5,),
                BlocBuilder<ComplaintsCubit,ComplaintsState>(
                  buildWhen: (previous, current) => previous != current,
                  builder: (context, state) {
                    return  BottomSheetButton(
                        value:cubit.selectedComplaintType,
                        title: "complaint_type".tr(),
                        sheetBuilder: (context) =>
                            BlocBuilder<ComplaintsCubit, ComplaintsState>(
                            builder: (context, state) {
                              final cubit = context.read<ComplaintsCubit>();
                              return BottomSheetList(
                                value: cubit.selectedComplaintType,
                                list: cubit.typesResponse?.complaintsTypes??[],
                                onChange: (v) {
                                  cubit.selectType(v);
                                  context.pop();
                                },
                                title: "complaint_type".tr(),
                                loading: state is LoadingTypes,
                              );
                            })
                    );
                  },
                ),

                SizedBox(height: edge*0.5,),
                TextInput(
                  controller: cubit.detailsController,
                  maxLine: 4,
                  validatorFun: (value)=>cubit.validateMessage(value),
                  title: "details".tr(),
                ),
                SizedBox(height: 60.h),

                BlocConsumer<ComplaintsCubit,ComplaintsState>(
                  buildWhen: (previous, current) => previous != current,
                  listenWhen: (previous, current) => previous != current,
                  builder: (context, state) {
                    return  GoButton(text: "submit".tr(), onTap: ()=>cubit.submitComplaint(),loading: state is Loading,);
                  },
                  listener: (context, state) {
                    state.whenOrNull(
                        success: (response) {
                          context.pushReplacementNamed(Routes.successScreen,arguments: "submit_message_successfully".tr());
                        },
                        error: (error){

                          print("error");
                        }
                    );
                  },
                )



              ],
            ),
          )
        ),
      ),
    );
  }

}
