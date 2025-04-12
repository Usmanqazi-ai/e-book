import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../screens/login_screen.dart';

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

  void nextPage() {
    if (currentPageIndex.value == 2) {
      Get.to(const LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }
}
