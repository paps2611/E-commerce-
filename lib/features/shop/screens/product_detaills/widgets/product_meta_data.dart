import 'package:flutter/material.dart';
import 'package:t_store/common/styles/rounded_container.dart';
import 'package:t_store/common/widgets/images/T_circular_image.dart';
import 'package:t_store/common/widgets/texts/brand_title_with_verification.dart';
import 'package:t_store/common/widgets/texts/price_tag.dart';
import 'package:t_store/common/widgets/texts/product_title_text.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/enums.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //price
        Row(
          children: [
            //sale tag
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
              decoration: BoxDecoration(
                color: TColors.secondary.withOpacity(0.8),
                borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
              ),
              child: Text(
                '50%', // Replace with actual discount tag
                style: Theme.of(context).textTheme.labelLarge!.apply(
                      color: TColors.black,
                    ),
              ),
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),

            //price
            Text(
              '\₹1500',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(decoration: TextDecoration.lineThrough),
            ),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            const TproductPriceTag(
              price: '750',
              isLarge: true,
            )
          ],
        ),

        const SizedBox(
          height: TSizes.spaceBtwItems / 1.5,
        ),
        //TITLE
        const TProductTitleText(title: 'Green Nike TShirt'),
        const SizedBox(
          height: TSizes.spaceBtwItems / 1.5,
        ),

        //STOCKS STATUS
        Row(
          children: [
            const TProductTitleText(title: 'Status'),
            const SizedBox(
              width: TSizes.spaceBtwItems / 1.5,
            ),
            Text(
              'In Stock',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),

        const SizedBox(
          height: TSizes.spaceBtwItems / 1.5,
        ),

        //BRAND
        Row(
          children: [
            TCircularImage(
              image: TImages.nikeLogo,
              overlayColor: dark ? TColors.white : TColors.black,
              width: 32,
              height: 32,
            ),
            const TBrandTitleWithVerification(
              title: 'Nike',
              brandTextSizes: TextSizes.medium,
            ),
          ],
        ),
      ],
    );
  }
}
