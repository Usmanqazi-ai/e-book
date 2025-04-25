import 'package:e_book_store/controllers/signup_controller.dart';
import 'package:e_book_store/screens/auth_screens/verify_email_screen.dart';
import 'package:e_book_store/services/firebase_toast.dart';
import 'package:e_book_store/services/firebse_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../models/user_model.dart';
import '../../utils/colors.dart';
import '../../utils/helpers/firebase_error_messages.dart';
import '../../utils/helpers/helper_functions.dart';
import '../../widgets/appBar.dart';
import '../../widgets/crc_prg_indicator.dart';
import '../../widgets/elevated_button.dart';
import '../../widgets/text_field.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    final controller = Get.put(SignupController());
    final auth = FirebaseAuth.instance;

    return Scaffold(
      appBar: const CustomAppbar(
        showBackArrow: true,
      ),
      body: Stack(children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 24.0, right: 24),
            child: Form(
              key: controller.formKey,
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
                    keyBoardType: TextInputType.text,
                    textEditingController: controller.nameEditCtrl,
                    validator: controller.validateText,
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
                    keyBoardType: TextInputType.emailAddress,
                    textEditingController: controller.emailEditCtrl,
                    validator: controller.validateText,
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
                  Obx(
                    () => UTextFilled(
                      hint: 'Password',
                      textEditingController: controller.passEditCtrl,
                      validator: controller.validateText,
                      keyBoardType: TextInputType.visiblePassword,
                      isPassword: controller.isVisible.value,
                      endIcon: IconButton(
                        onPressed: controller.isPasVisible,
                        icon: Image.asset(
                            controller.isVisible.value
                                ? "assets/icons/eye_close.png"
                                : "assets/icons/eye_open.png",
                            height: 22),
                      ),
                      isDarkMode: dark,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedBtn(
                      title: "Register",
                      onPressed: () {
                        if (controller.formKey.currentState!.validate()) {
                          final user = UserModel(
                              name: controller.nameEditCtrl.text.trim(),
                              email: controller.emailEditCtrl.text.trim(),
                              password: controller.passEditCtrl.text.trim());
                          controller.indicator.value = true;
                          auth
                              .createUserWithEmailAndPassword(
                                  email: controller.emailEditCtrl.text,
                                  password: controller.passEditCtrl.text)
                              .then((onValue) {
                            FirebaseServices().createUser(user);
                            controller.indicator.value = false;
                            Get.to(VerifyEmailScreen(
                              email: controller.emailEditCtrl.text.trim(),
                            ));
                          }).onError((FirebaseAuthException error, trace) {
                            controller.indicator.value = false;
                            final message =
                                FirebaseAuthError.getMessage(error.code);
                            CustomToast().showToastMsg(message);
                            controller.indicator.value = false;
                          });
                        }
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
        ),
        Obx(
          () => Visibility(
            visible: controller.indicator.value,
            child: const CustomLoader(),
          ),
        ),
      ]),
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
