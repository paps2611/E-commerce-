import 'package:flutter/material.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';
import '../../../utils/constants/enums.dart';


class TBrandTitle extends StatelessWidget {
  const TBrandTitle({
    super.key,
    required this.title,
    this.maxLines = 1,
    this.textAlign = TextAlign.center,
    this.brandTextSizes = TextSizes.small,
    this.color,
  });

  final String title;
  final int maxLines;
  final Color? color;
  final TextAlign? textAlign;
  final TextSizes brandTextSizes;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Text(title,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        style: brandTextSizes == TextSizes.small
            ? Theme.of(context).textTheme.labelMedium!.apply(color: color)
            : brandTextSizes == TextSizes.medium
            ? Theme.of(context).textTheme.labelLarge!.apply(color: color)
            : brandTextSizes == TextSizes.large
            ? Theme.of(context).textTheme.titleLarge!.apply(color: color)
            : Theme.of(context).textTheme.bodyMedium!.apply(color: color)
    );
  }
}
