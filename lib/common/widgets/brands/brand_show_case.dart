import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../products/brand_card.dart';
class TBrandShowCase extends StatelessWidget {
  const TBrandShowCase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      //TROUNDED CONTAINER
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      padding: const EdgeInsets.all(TSizes.sm),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: TColors.darkerGrey.withOpacity(0.5)),
        color: Colors.transparent,
      ),
      child: Column(
        children: [
          const TBrandCard(showBorder: false),
          const SizedBox(height: TSizes.spaceBtwItems,),
          Row(children: images.map((image) =>
              brandTopProductImageWidget(image, context)).toList()),
        ],
      ),
    );
  }
}
Widget brandTopProductImageWidget(String image, context) {
  return Expanded(
    child: Container(
      height: 100,
      padding: const EdgeInsets.all(TSizes.md),
      margin: const EdgeInsets.only(right: TSizes.sm),
      decoration: BoxDecoration(
        color: THelperFunctions.isDarkMode(context)
            ? TColors.darkerGrey
            : TColors.light,
      ),
      child: Image(fit: BoxFit.contain, image: AssetImage(image)),
    ),
  );
}
