import 'package:e_book_store/screens/auth_screens/forgot_password.dart';
import 'package:e_book_store/screens/home_screens/home_screen.dart';
import 'package:e_book_store/utils/colors.dart';
import 'package:e_book_store/widgets/appBar.dart';
import 'package:e_book_store/widgets/elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../bottom_navigation_bar.dart';
import '../utils/helpers/helper_functions.dart';
import '../widgets/text_field.dart';
import 'auth_screens/sign_up_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                "Welcome Back 👋",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Sign to your account",
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
                hint: 'Your Email',
                isDarkMode: dark,
              ),
              const SizedBox(
                height: 20,
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
                height: 10,
              ),
              TextButton(
                  onPressed: () {
                    Get.to(const ForgotPassword());
                  },
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(
                        color: UColors.primary,
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  )),
              const SizedBox(
                height: 10,
              ),
              ElevatedBtn(
                  title: "Login",
                  onPressed: () {
                    Get.to(() => const BottomNavigationMenu());
                  },
                  radius: 30),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don`t have an account?",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  TextButton(
                      onPressed: () => {Get.to((const SignUpScreen()))},
                      child: const Text(
                        'Sign up',
                        style: TextStyle(
                            color: UColors.primary,
                            fontWeight: FontWeight.bold),
                      )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Expanded(
                    child: Divider(),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "or with",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ),
                  const Expanded(
                    child: Divider(),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {},
                  label: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "Sign in with Google",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  icon: Image.asset(
                    "assets/icons/google_icon.png",
                    height: 16,
                    width: 16,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {},
                  label: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      "Sign in with Apple",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  icon: Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.white,
                    ),
                    child: Image.asset(
                      "assets/icons/apple_icon.png",
                      height: 16,
                      width: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
