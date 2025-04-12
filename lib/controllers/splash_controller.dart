import 'dart:async';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../screens/auth_screens/onBoarding.dart';

class SplashController {
  Future<void> isLogin() async {
    // bool hasSeenOnboarding = await USharedPreferencesServices.isUserSeenValue();
    // print("HASSEeenOnboarding : $hasSeenOnboarding");
    // user = auth.currentUser;
    // if (user != null) {
    //   Timer(Duration(seconds: 2), () => Get.offAll(() => HomeScreen()));
    // } else {
    //   if (hasSeenOnboarding) {
    //     Timer(
    //       Duration(seconds: 2),
    //           () => Get.offAll(() => SignInScreen()),
    //     );
    //   } else {
    Timer(
        const Duration(seconds: 2), () => Get.offAll(() => OnboardingScreen()));
    //     }
    //   }
  }
}
