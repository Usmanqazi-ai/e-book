import 'package:flutter/material.dart';

import '../utils/colors.dart';

class ElevatedBtn extends StatelessWidget {
  const ElevatedBtn({
    required this.title,
    super.key,
    required this.onPressed,
    required this.radius,
  });

  final String title;
  final VoidCallback onPressed;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: UColors.primary,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius))),
        child: Text(
          title,
          style: const TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
