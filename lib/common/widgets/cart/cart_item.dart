import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../images/t_rounded_image.dart';
import '../texts/brand_title_with_verification.dart';
import '../texts/product_title_text.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,

  });


  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      children: [
        //image
        TRoundedImage(imageUrl: TImages.productImage1,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(TSizes.sm),
          backgroundColor: dark ? TColors.darkerGrey :TColors.light,
        ),
        const SizedBox(width: TSizes.spaceBtwItems,),

        //TITLE PRICE SIZE
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            TBrandTitleWithVerification(title: 'Nike'),
            const Flexible(child:TProductTitleText(title: 'Black Sport Shoes',maxLines: 1,)),

            //ATRIBUTES
            Text.rich(TextSpan(children: [
              TextSpan(text: 'Color',style: Theme.of(context).textTheme.bodySmall),
              TextSpan(text: 'Green',style: Theme.of(context).textTheme.bodyLarge),
              TextSpan(text: 'Size',style: Theme.of(context).textTheme.bodySmall),
              TextSpan(text: 'UK 10',style: Theme.of(context).textTheme.bodyLarge),
            ])),

          ],
        ),
      ],
    );
  }
}
