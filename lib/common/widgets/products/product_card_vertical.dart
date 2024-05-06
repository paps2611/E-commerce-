import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/shop/screens/product_detaills/product_details.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/common/widgets/images/t_rounded_image.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../icons/circular_icon.dart';
import '../texts/brand_title_with_verification.dart';
import '../texts/price_tag.dart';
import '../texts/product_title_text.dart';

class TProductCardVertical extends StatelessWidget {
  const
  TProductCardVertical({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: ()=> Get.to(() => const TProductDetailScreen()),
      child: Container(
        width: 180,
        height: 180,
        decoration: BoxDecoration(
          color: dark ? TColors.dark : TColors.light,
          borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
          boxShadow: [
            BoxShadow(
              color: TColors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
      
        child: Stack(
          children: [
            // Product image
            Positioned(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
                child: const TRoundedImage(
                  imageUrl: TImages.productImage1,
                  height: 120,
                  width: double.infinity,
                  // Replace with actual image URL
                  applyImageRadius: true,
                ),
              ),
            ),
            // Discount tag
            Positioned(
              top: 12,
              left: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
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
              ),
            ),
            //WIshlist button
            const Positioned(
              top: -4,
              right: 0,
              child: HeartIcon(
                borderColor: TColors.white,
                insideColor: Colors.red,
                size: 24,
                icon: Icons.favorite,
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
      
            //TEXT Widget for pRoduct
            const Positioned(
              left: 8,
              right: 8,
              bottom: 40,
              child: Padding(
                padding: EdgeInsets.only(left: TSizes.sm),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TProductTitleText(
                      title: 'Green Nike Air Shoes',
                      smallSize: true,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
      
            const Positioned(
              left: 16,
              bottom: 28,
              child: TBrandTitleWithVerification(title: 'Nike',),
            ),
            const Spacer(),

            Positioned(
              left: 8,
              bottom: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //price
                  const Padding(
                    padding: EdgeInsets.only(left: TSizes.sm),
                    child: TproductPriceTag(price: '3000',),
                  ),

                  const SizedBox(width: TSizes.defaultSpace,),
                  Container(
                    decoration: const BoxDecoration(
                      color: TColors.dark,
                      // Set background color based on theme mode
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(TSizes.cardRadiusMd),
                        bottomRight: Radius.circular(TSizes.productImageRadius),
                      ),
                    ),
                    child:const SizedBox(
                        width: TSizes.iconLg * 1.2,
                        height: TSizes.iconLg * 1.2,
                        child: Center(
                          child: Icon(
                            Iconsax.add,
                            color:  TColors.white,
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
