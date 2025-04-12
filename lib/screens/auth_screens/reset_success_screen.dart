import 'package:e_book_store/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../widgets/elevated_button.dart';

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
              'Email Sent',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Center(
              child: Text(
                "Email send to yours provided email account,",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            Center(
              child: Text(
                "Please check your email",
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedBtn(
              onPressed: () {
                Get.to(const LoginScreen());
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
