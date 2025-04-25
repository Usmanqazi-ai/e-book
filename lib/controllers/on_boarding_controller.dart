import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/auth_screens/login_screen.dart';

class OnBoardingController extends GetxController {
  final pageController = PageController();
  var currentPageIndex = 0.obs;

  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }

  void dotsClicked(index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

  void updatePageInductor(index) => currentPageIndex.value = index;

  visibilityBtn() {
    bool value;
    if (currentPageIndex.value == 2) {
      return value = true;
    } else {
      return value = false;
    }
  }

  Future<void> setOnboardingSeen() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboarding_seen', true);
  }

  void nextPage() {
    if (currentPageIndex.value == 2) {
      setOnboardingSeen();
      Get.to(const LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }
}
