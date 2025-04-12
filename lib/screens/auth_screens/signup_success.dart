import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../widgets/elevated_button.dart';
import '../login_screen.dart';

class SignupSuccess extends StatelessWidget {
  const SignupSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/sussess_img.png",
              width: 160,
              height: 190,
            ),
            Text(
              'Congratulation!',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Center(
              child: Text(
                "your account is complete, please enjoy the best menu from us.",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedBtn(
              onPressed: () {
                Get.offAll(const LoginScreen());
              },
              title: 'Get Started',
              radius: 30,
            )
          ],
        ),
      ),
    );
  }
}
