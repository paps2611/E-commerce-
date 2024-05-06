import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';

class TRoundedContainer extends StatelessWidget {
  const TRoundedContainer(
      {super.key,
      this.width,
      this.height=56,
      this.radius = TSizes.cardRadiusLg,
      this.child,
      this.showBorder = false,
      this.borderColor = TColors.primary,
      this.backgroundColor = Colors.white,
      this.padding,
      this.margin});

  final double? width, height;
  final double radius;
  final Widget? child;
  final bool showBorder;
  final Color borderColor, backgroundColor;
  final EdgeInsetsGeometry? padding, margin;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
        decoration: BoxDecoration(
          color: TColors.secondary.withOpacity(0.8),
          borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
        ),
        child: Text(
          '25%', // Replace with actual discount tag
          style: Theme.of(context).textTheme.labelLarge!.apply(
            color: TColors.black,
          ),
        ),
    );
  }
}
