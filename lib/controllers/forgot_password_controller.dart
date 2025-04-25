import 'package:e_book_store/services/firebase_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../utils/helpers/firebase_error_messages.dart';

class ForgotPasswordController extends GetxController {
  static ForgotPasswordController get instance => Get.find();
  final formKey = GlobalKey<FormState>();

  final _auth = FirebaseAuth.instance;

  final emailCtrl = TextEditingController();

  Future<void> sendForgotPasswordEmail() async {
    try {
      await _auth.sendPasswordResetEmail(email: emailCtrl.text.trim());
      CustomToast().showToastMsg("Email Sent ");
    } on FirebaseAuthException catch (e) {
      final message = FirebaseAuthError.getMessage(e.code);
      CustomToast().showToastMsg(message); // Example using GetX
    }
  }

  String? validateText(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field cannot be empty';
    }
    // final emailRegExp =
    //     RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
    //
    // if (emailRegExp.hasMatch(value)) {
    //   return "Invalid email address";
    // }
    return null;
  }
}
