import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../theming/colors_manager.dart';

class CustomAppImage extends StatelessWidget {
  final String image;
  final double? borderRadius;
  final double height;
  final double width;
  final BoxFit boxFit;
  final EdgeInsetsGeometry outerPadding;
  final Color shimmerHighlightColor;
  final Color shimmerBaseColor;

  final BoxShape boxShape;

  const CustomAppImage({
    super.key,
    required this.image,
    this.borderRadius = 15,
    this.height = double.infinity,
    this.width = double.infinity,
    this.boxFit = BoxFit.cover,
    this.outerPadding = EdgeInsets.zero,
    this.shimmerHighlightColor = ColorsManager.white,
    this.shimmerBaseColor = ColorsManager.lightGrey,
    this.boxShape = BoxShape.rectangle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: outerPadding,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius ?? 15),
        child: FancyShimmerImage(
          imageUrl: image,
          height: height,
          width: width,
          shimmerHighlightColor: shimmerHighlightColor,
          // Background Color
          shimmerBaseColor: shimmerBaseColor,
          shimmerDirection: ShimmerDirection.ttb,
          boxFit: boxFit,
          shimmerDuration: const Duration(seconds: 2),
          alignment: Alignment.center,
          errorWidget: const Icon(Icons.error, color: ColorsManager.error),
          boxDecoration: BoxDecoration(
            color: shimmerBaseColor,
            shape: boxShape,
            borderRadius:
                borderRadius == null
                    ? null
                    : BorderRadius.circular(borderRadius!),
          ),
        ),
      ),
    );
  }
}
