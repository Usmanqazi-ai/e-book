import 'package:e_book_store/screens/auth_screens/reset_success_screen.dart';
import 'package:e_book_store/utils/helpers/helper_functions.dart';
import 'package:e_book_store/widgets/appBar.dart';
import 'package:e_book_store/widgets/elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/text_field.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: CustomAppbar(
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
              UTextFilled(
                hint: 'Email',
                isDarkMode: dark,
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedBtn(
                onPressed: () {
                  Get.to(const SuccessScreen());
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
