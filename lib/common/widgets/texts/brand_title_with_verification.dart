import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/texts/brand_title_text.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/sizes.dart';

class TBrandTitleWithVerification extends StatelessWidget {
  const TBrandTitleWithVerification({
    super.key,
    required this.title,
    this.maxLines=1,
    this.textColor,
    this.iconColor= TColors.primary,
    this.textAlign= TextAlign.center,
    this.brandTextSizes= TextSizes.small,
  });

  final String title;
  final int maxLines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSizes;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
          Flexible(
              child: TBrandTitle(
                title : title,
                color: textColor,
                maxLines: maxLines,
                textAlign: textAlign,
                brandTextSizes: brandTextSizes,
              )
          ),
        const SizedBox(width: 2,),
        Icon(Icons.verified,color: iconColor,size: TSizes.iconXs,),
        ]
    );
  }
}
