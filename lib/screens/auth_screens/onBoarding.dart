import 'package:e_book_store/controllers/on_boarding_controller.dart';
import 'package:e_book_store/utils/colors.dart';
import 'package:e_book_store/utils/constant/strings.dart';
import 'package:e_book_store/widgets/elevated_btn_white.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../utils/helpers/helper_functions.dart';
import '../../widgets/elevated_button.dart';
import '../../widgets/onBoardingWidgets.dart';
import 'login_screen.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final controller = Get.put(OnBoardingController());

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 24.0, right: 24, top: 35),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          TextButton(
              onPressed: controller.skipPage,
              child: Text(
                UTexts.skip,
                style: Theme.of(context).textTheme.bodyMedium,
              )),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: PageView(
              onPageChanged: controller.updatePageInductor,
              controller: controller.pageController,
              children: const [
                OnBoardings(
                  title: "Now reading books will be easier",
                  img: "assets/images/onBoarding1.png",
                  subTitle:
                      " Discover new worlds, join a vibrant reading community. Start your reading adventure effortlessly with us.",
                ),
                OnBoardings(
                  title: "Your Bookish Soulmate Awaits",
                  img: "assets/images/onBoarding2.png",
                  subTitle:
                      "Let us be your guide to the perfect read. Discover books tailored to your tastes for a truly rewarding experience.",
                ),
                OnBoardings(
                  title: "Start Your Adventure",
                  img: "assets/images/onBoarding3.png",
                  subTitle:
                      "Ready to embark on a quest for inspiration and knowledge? Your adventure begins now. Let's go!",
                ),
              ],
            ),
          ),
          Center(
            child: SmoothPageIndicator(
              controller: controller.pageController,
              count: 3,
              onDotClicked: controller.dotsClicked,
              effect: const ExpandingDotsEffect(
                  activeDotColor: UColors.primary, dotHeight: 7, dotWidth: 7),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedBtn(
            title: 'Continue',
            onPressed: controller.nextPage,
            radius: 10,
          ),
          const SizedBox(
            height: 10,
          ),
          Obx(
            () => Visibility(
              visible: controller.visibilityBtn(),
              child: ElevatedBtnWhite(
                  title: "Sign in",
                  onPressed: () {
                    Get.to(const LoginScreen());
                  }),
            ),
          ),
          const SizedBox(
            height: 20,
          )
        ]),
      ),
    );
  }
}
