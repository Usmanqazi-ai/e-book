import 'package:e_book_store/controllers/verify_email_controller.dart';
import 'package:e_book_store/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  VerifyEmailScreen({super.key, this.email});
  final String? email;

  final controller = Get.put(VerifyEmailController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Icon(
              Icons.mark_email_unread_outlined,
              color: UColors.primary,
              size: 110,
            ),
          ),
          Text(
            email!,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(color: Colors.grey),
          ),
          Text(
            "Email Sent to your this Email Account ",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Please check your email ",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ],
      ),
    );
  }
}
