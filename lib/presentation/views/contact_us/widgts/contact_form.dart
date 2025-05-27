import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tamweelytask/core/constants/dimensions_constants.dart';
import 'package:tamweelytask/core/utils/extension.dart';


import '../../../../core/theming/widgets/go_button.dart';
import '../../../../core/theming/widgets/text_input.dart';
import '../../../../routing/routes.dart';
import '../../../view_models/contact_us/contact_us_cubit.dart';
import '../../../view_models/contact_us/contact_us_state.dart';

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  ContactFormState createState() => ContactFormState();
}

class ContactFormState extends State<ContactForm> {

  late final cubit=context.read<ContactUsCubit>();

  @override
  Widget build(BuildContext context) {
    return  Form(
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
          TextInput(
            controller: cubit.messageController,
            maxLine: 4,
            validatorFun: (value)=>cubit.validateMessage(value),
            title: "Message".tr(),
          ),
           SizedBox(height: 35.h),
          BlocConsumer<ContactUsCubit,ContactUsState>(
            buildWhen: (previous, current) => previous != current,
            listenWhen: (previous, current) => previous != current,
            builder: (context, state) {
              return  GoButton(text: "submit".tr(), onTap: cubit.submitForm,loading: state is Loading,);
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
    );
  }
}
