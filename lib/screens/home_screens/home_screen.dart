import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_book_store/controllers/home_controller.dart';
import 'package:e_book_store/utils/colors.dart';
import 'package:e_book_store/utils/helpers/helper_functions.dart';
import 'package:e_book_store/widgets/appBar.dart';
import 'package:e_book_store/widgets/rounded_image.dart';
import 'package:e_book_store/widgets/section_heading_with_btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../widgets/circuler_container.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: CustomAppbar(
        leadingIcon: Icons.search_outlined,
        title: Center(
          child: Text(
            "Home",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        actions: [
          Icon(
            Icons.notifications_none,
            color: dark ? Colors.white : Colors.black,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  onPageChanged: (index, _) =>
                      controller.updatePageIndicator(index),
                  viewportFraction: 1,
                ),
                items: [
                  'assets/images/carousel_image.png',
                  'assets/images/carousel_image.png',
                  'assets/images/carousel_image.png',
                ].map((url) => URoundedImage(imgUrl: url)).toList(),
              ),
              Center(
                child: Obx(
                  () => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (int i = 0; i < 3; i++)
                        UCircularContainer(
                          margin: const EdgeInsets.only(right: 10),
                          backgroundColor: controller.carouselCurrentIndex == i
                              ? UColors.primary
                              : Colors.grey,
                          height: controller.carouselCurrentIndex == i ? 7 : 4,
                          width: controller.carouselCurrentIndex == i ? 7 : 4,
                        ),
                    ],
                  ),
                ),
              ),
              const USectionHeading(
                title: "Top of Week",
                showActionButton: true,
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6.0),
                        child: SizedBox(
                          height: 150,
                          width: 100,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const URoundedImage(
                                fit: BoxFit.cover,
                                imgUrl: "assets/images/book_cover.png",
                                height: 160,
                                width: 100,
                                borderRadius: 10,
                              ),
                              Text(
                                "Brown Rusty Mystery Novels",
                                style: Theme.of(context).textTheme.bodyMedium,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                "\$14.99",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.apply(color: UColors.primary),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
              const USectionHeading(
                title: "Best Vendors",
                showActionButton: true,
              ),
              Container(
                height: 100,
                padding: const EdgeInsets.only(
                  right: 8,
                ),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                        ),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: UColors.textFiledColor,
                          ),
                          child: const URoundedImage(
                            fit: BoxFit.fill,
                            imgUrl: "assets/images/company_logo.png",
                            backgroundColor: UColors.textFiledColor,
                            borderRadius: 10,
                          ),
                        ),
                      );
                    }),
              ),
              const USectionHeading(
                title: "Authors",
                showActionButton: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
