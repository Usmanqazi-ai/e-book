import 'package:flutter/material.dart';

import '../utils/constant/strings.dart';

class OnBoardings extends StatelessWidget {
  const OnBoardings({
    required this.title,
    required this.img,
    required this.subTitle,
    super.key,
  });

  final img, title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(child: Image.asset(img)),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              textAlign: TextAlign.center,
              title,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              textAlign: TextAlign.center,
              subTitle,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ),
      ],
    );
  }
}
