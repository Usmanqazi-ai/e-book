import 'package:e_book_store/utils/colors.dart';
import 'package:e_book_store/widgets/appBar.dart';
import 'package:e_book_store/widgets/grid_layout.dart';
import 'package:e_book_store/widgets/tab_bar.dart';
import 'package:flutter/material.dart';

import '../../utils/helpers/helper_functions.dart';
import '../../widgets/rounded_image.dart';

class VendorsScreen extends StatelessWidget {
  const VendorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: CustomAppbar(
            title: Center(
                child: Text(
              "Vendors",
              style: Theme.of(context).textTheme.headlineMedium,
            )),
            showBackArrow: true,
            actions: [
              Icon(
                Icons.search,
                color: dark ? Colors.white : Colors.black,
              )
            ]),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Our Vendors",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: UColors.lightGry),
              ),
              Text(
                "Vendors",
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(color: UColors.primary),
              ),
              const UTabBar(tabs: [
                Text(
                  "All",
                ),
                Text(
                  "Books",
                ),
                Text(
                  "Poems",
                ),
                Text(
                  "Spacial for you",
                ),
                Text(
                  "Statics",
                ),
              ]),
              const Flexible(
                child: TabBarView(children: [
                  TabViewVendors(),
                  TabViewVendors(),
                  TabViewVendors(),
                  TabViewVendors(),
                  TabViewVendors(),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TabViewVendors extends StatelessWidget {
  const TabViewVendors({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return UGridLayout(
      itemCount: 16,
      mainAxisExtent: 150,
      itemBuilder: (_, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const URoundedImage(
                height: 100,
                fit: BoxFit.contain,
                imgUrl: "assets/images/brand_img_2.png",
                backgroundColor: UColors.textFiledColor,
                borderRadius: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Kuromi",
                style: Theme.of(context).textTheme.titleLarge,
              )
            ],
          ),
        );
      },
      crossAxisCount: 3,
    );
  }
}
