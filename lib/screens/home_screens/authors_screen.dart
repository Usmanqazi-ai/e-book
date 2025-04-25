import 'package:e_book_store/screens/home_screens/author_detail.dart';
import 'package:e_book_store/utils/colors.dart';
import 'package:e_book_store/widgets/appBar.dart';
import 'package:e_book_store/widgets/circuler_image.dart';
import 'package:e_book_store/widgets/tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/helpers/helper_functions.dart';

class AuthorsScreen extends StatelessWidget {
  const AuthorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: CustomAppbar(
            title: Center(
                child: Text(
              "Authors",
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
                "Our Authors",
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(color: UColors.lightGry),
              ),
              Text(
                "Authors",
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
                  TabViewAuthor(),
                  TabViewAuthor(),
                  TabViewAuthor(),
                  TabViewAuthor(),
                  TabViewAuthor(),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TabViewAuthor extends StatelessWidget {
  const TabViewAuthor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (_, index) {
          return ListTile(
            contentPadding: const EdgeInsets.only(top: 10),
            title: Text(
              "Jhon Freeman",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            subtitle: Text(
              "American writer he  was the editor of the  ",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            leading: const UCirculerImage(
              image: "assets/images/writer_image.png",
            ),
            onTap: () => Get.to(const AuthorDetail()),
          );
        });
  }
}
