import 'package:flutter/material.dart';
import 'package:t_store/common/styles/rounded_container.dart';
import 'package:t_store/common/widgets/texts/price_tag.dart';
import 'package:t_store/common/widgets/texts/product_title_text.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../../../common/widgets/chips/choice_chip.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        //sekected attribute pricing
        Container(
          //USed as Rounded Container
          padding: const EdgeInsets.all(TSizes.md),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: dark ? TColors.darkerGrey : TColors.grey,
            border: Border.all(),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  const TSectionHeading(
                    title: 'Variations',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    width: TSizes.spaceBtwItems / 1.5,
                  ),

                  //ACTUAL PRICE
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const TProductTitleText(
                            title: 'Price',
                            smallSize: true,
                          ),
                          const SizedBox(
                            width: TSizes.spaceBtwItems / 1.5,
                          ),
                          //ACTUAL PRICe
                          Text(
                            '\₹1500',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(
                            width: TSizes.spaceBtwItems / 1.5,
                          ),
                          //SALE PRICe
                          const TproductPriceTag(price: '750'),
                        ],
                      ),
                      //STOCKS DETAILS
                      Row(
                        children: [
                          const TProductTitleText(
                            title: 'Stock',
                            smallSize: true,
                          ),
                          const SizedBox(
                            width: TSizes.spaceBtwItems / 1.5,
                          ),
                          Text(
                            "In Stock",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              //Variations DEscription
              const TProductTitleText(
                title:
                    'This is the Description of the product and all its properties',
                smallSize: true,
                maxLines: 4,
              )
            ],
          ),
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),

        //--ATTRIBUTES
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TSectionHeading(title: 'Colors',showActionButton: false,),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(text: 'Green',selected: true,onSelected: (value){},),
                TChoiceChip(text: 'Blue',selected: false,onSelected: (value){}),
                TChoiceChip(text: 'Red',selected: false,onSelected: (value){}),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const TSectionHeading(title: 'Size',showActionButton: false,),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
              Wrap(
                spacing: 8,
                children: [
                  TChoiceChip(text: '34',selected: true,onSelected: (value){}),
                  TChoiceChip(text: '36',selected: false,onSelected: (value){}),
                  TChoiceChip(text: '38',selected: false,onSelected: (value){}),
                ],
              ),
          ],
        ),
      ],
    );
  }
}
