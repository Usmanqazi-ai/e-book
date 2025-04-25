import 'package:e_book_store/controllers/forgot_password_controller.dart';
import 'package:e_book_store/screens/auth_screens/password_rest_success_screen.dart';
import 'package:e_book_store/utils/helpers/helper_functions.dart';
import 'package:e_book_store/widgets/appBar.dart';
import 'package:e_book_store/widgets/elevated_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../services/firebase_toast.dart';
import '../../utils/helpers/firebase_error_messages.dart';
import '../../widgets/text_field.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});

  final controller = Get.put(ForgotPasswordController());

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: const CustomAppbar(
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Reset Password",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Please enter your email, we will send verification code to your email.",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Email",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 10,
              ),
              Form(
                key: controller.formKey,
                child: UTextFilled(
                  hint: 'Email',
                  isDarkMode: dark,
                  keyBoardType: TextInputType.emailAddress,
                  textEditingController: controller.emailCtrl,
                  validator: controller.validateText,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedBtn(
                onPressed: () {
                  if (controller.formKey.currentState!.validate()) {
                    controller.sendForgotPasswordEmail().then((onValue) {
                      Get.to(const PasswordRestSuccessScreen());
                    }).onError((FirebaseAuthException error, trace) {
                      final message = FirebaseAuthError.getMessage(error.code);
                      CustomToast().showToastMsg(message);
                    });
                  }
                },
                title: 'Send',
                radius: 30,
              )
            ],
          ),
        ),
      ),
    );
  }
}
