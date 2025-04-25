import 'dart:async';

import 'package:e_book_store/screens/auth_screens/reset_success_screen.dart';
import 'package:e_book_store/services/firebase_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  final _auth = FirebaseAuth.instance;

  Future<void> sendUserEmail() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
      CustomToast().showToastMsg("Email has been Sent");
    } catch (e) {
      CustomToast().showToastMsg(e.toString());
    }
  }

  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      _auth.currentUser?.reload();

      final user = FirebaseAuth.instance.currentUser;

      if (user!.emailVerified) {
        timer.cancel();
        Get.off(const SuccessScreen());
      }
    });
  }

  @override
  void onInit() {
    sendUserEmail();
    setTimerForAutoRedirect();
    // TODO: implement onInit
    super.onInit();
  }
}
