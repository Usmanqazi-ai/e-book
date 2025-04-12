import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class URoundedImage extends StatelessWidget {
  const URoundedImage({
    super.key,
    this.height,
    this.width,
    required this.imgUrl,
    this.applyImageRadius = true,
    this.border,
    this.backgroundColor,
    this.fit = BoxFit.contain,
    this.padding,
    this.isNetworkImage = false,
    this.onPressed,
    this.borderRadius = 10,
  });

  final double? height, width;
  final String imgUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color? backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            border: border,
            color: backgroundColor),
        child: ClipRRect(
          borderRadius: applyImageRadius
              ? BorderRadius.circular(borderRadius)
              : BorderRadius.zero,
          child: Center(
            child: isNetworkImage
                ? CachedNetworkImage(
                    imageUrl: imgUrl,
                    fit: fit,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(
                      color: Colors.grey,
                    ),
                    errorWidget: (context, url, error) => const Row(
                      children: [
                        Text("Image not found"),
                        Icon(Icons.error),
                      ],
                    ),
                  )
                : Image.asset(imgUrl, fit: fit),
          ),
        ),
      ),
    );
  }
}
