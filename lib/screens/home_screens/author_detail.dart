import 'package:e_book_store/widgets/appBar.dart';
import 'package:e_book_store/widgets/circuler_image.dart';
import 'package:e_book_store/widgets/grid_layout.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import '../../widgets/rounded_image.dart';

class AuthorDetail extends StatelessWidget {
  const AuthorDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: Text(
          "Authors",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(right: 24.0, left: 24, top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                  child: UCirculerImage(
                image: "assets/images/writer_image.png",
                height: 125,
                width: 125,
              )),
              Center(
                child: Text(
                  "Novelist",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  "Jhon Freeman",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "About",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Gunty was born and raised in South Bend, Indiana.She graduated from the University of Notre Dame with a Bachelor of Arts in English and from New York University.",
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Products",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(
                height: 20,
              ),
              UGridLayout(
                itemCount: 8,
                itemBuilder: (_, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const URoundedImage(
                        fit: BoxFit.fill,
                        imgUrl: "assets/images/book_cover.png",
                        height: 130,
                        width: 140,
                        borderRadius: 20,
                        backgroundColor: Colors.grey,
                      ),
                      SizedBox(
                        width: 140,
                        child: Text(
                          "Brown Soul Novelsglkerq",
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
                },
                crossAxisCount: 2,
                mainAxisExtent: 170,
              )
            ],
          ),
        ),
      ),
    );
  }
}
