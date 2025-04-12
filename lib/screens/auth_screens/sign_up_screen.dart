import 'package:e_book_store/screens/auth_screens/signup_success.dart';
import 'package:e_book_store/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../utils/colors.dart';
import '../../utils/helpers/helper_functions.dart';
import '../../widgets/appBar.dart';
import '../../widgets/elevated_button.dart';
import '../../widgets/text_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: const CustomAppbar(
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Sign Up",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Create account and choose favorite menu",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Name",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 10,
              ),
              UTextFilled(
                hint: 'Name',
                isDarkMode: dark,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Email",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 10,
              ),
              UTextFilled(
                hint: 'Your Email',
                isDarkMode: dark,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Password",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 10,
              ),
              UTextFilled(
                hint: 'Password',
                endIcon: Image.asset(
                  "assets/icons/eye_close.png",
                ),
                isDarkMode: dark,
              ),
              const SizedBox(
                height: 40,
              ),
              ElevatedBtn(
                  title: "Register",
                  onPressed: () {
                    Get.to(const SignupSuccess());
                  },
                  radius: 30),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Have an account?",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: const Text(
                      ' Sign in',
                      style: TextStyle(
                          color: UColors.primary,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "By clicking Register, you agree to our",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const Text(
            'Terms and Data Policy.',
            style:
                TextStyle(color: UColors.primary, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
