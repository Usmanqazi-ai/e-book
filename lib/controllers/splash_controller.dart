import 'dart:async';

import 'package:e_book_store/screens/auth_screens/login_screen.dart';
import 'package:e_book_store/screens/home_screens/manual_navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/auth_screens/onBoarding.dart';

class SplashController extends GetxController {
  static SplashController get instance => Get.find();

  final auth = FirebaseAuth.instance;
  Future<void> isLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final seen = prefs.getBool('onboarding_seen') ?? false;

    final user = auth.currentUser;
    if (user != null) {
      Timer(const Duration(seconds: 2),
          () => Get.offAll(() => const ManualNavigation()));
    } else {
      if (seen) {
        Timer(
          const Duration(seconds: 2),
          () => Get.offAll(() => const LoginScreen()),
        );
      } else {
        Timer(const Duration(seconds: 2),
            () => Get.offAll(() => OnboardingScreen()));
      }
    }
  }
}
