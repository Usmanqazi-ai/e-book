import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/elevated_button.dart';
import 'login_screen.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

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
              'Email Verified',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(
              height: 40,
            ),
            Center(
              child: Text(
                "Go to Login Page",
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
              title: 'Login',
              radius: 30,
            )
          ],
        ),
      ),
    );
  }
}
