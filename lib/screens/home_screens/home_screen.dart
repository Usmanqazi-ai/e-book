import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_book_store/controllers/home_controller.dart';
import 'package:e_book_store/screens/home_screens/authors_screen.dart';
import 'package:e_book_store/screens/home_screens/vendors_screen.dart';
import 'package:e_book_store/utils/colors.dart';
import 'package:e_book_store/utils/helpers/helper_functions.dart';
import 'package:e_book_store/widgets/appBar.dart';
import 'package:e_book_store/widgets/circuler_image.dart';
import 'package:e_book_store/widgets/rounded_image.dart';
import 'package:e_book_store/widgets/section_heading_with_btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                height: 170,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (_, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const URoundedImage(
                            fit: BoxFit.fitWidth,
                            imgUrl: "assets/images/book_cover.png",
                            height: 130,
                            width: 100,
                            borderRadius: 20,
                          ),
                          SizedBox(
                            width: 100,
                            child: Text(
                              "Brown Soul Novels",
                              style: Theme.of(context).textTheme.bodyMedium,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Text(
                            "\$14.99",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.apply(color: UColors.primary),
                          )
                        ],
                      );
                    }),
              ),
              USectionHeading(
                title: "Best Vendors",
                showActionButton: true,
                onPressed: () {
                  Get.to(const VendorsScreen());
                },
              ),
              Container(
                height: 80,
                padding: const EdgeInsets.only(
                  right: 8,
                ),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (_, index) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 5.0,
                        ),
                        child: URoundedImage(
                          fit: BoxFit.cover,
                          width: 80,
                          imgUrl: "assets/images/company_logo.png",
                          backgroundColor: UColors.textFiledColor,
                          borderRadius: 10,
                          padding: EdgeInsets.symmetric(horizontal: 5),
                        ),
                      );
                    }),
              ),
              USectionHeading(
                title: "Authors",
                showActionButton: true,
                onPressed: () => Get.to(const AuthorsScreen()),
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (_, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const UCirculerImage(
                            height: 100,
                            width: 100,
                            image: 'assets/images/writer_image.png',
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "John Freeman",
                            style: Theme.of(context).textTheme.bodyMedium,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text("Writer",
                              style: Theme.of(context).textTheme.bodySmall)
                        ],
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
