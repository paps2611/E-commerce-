import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:t_store/features/shop/screens/product_reviews/widget/ratingbar_indicator.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(TImages.userProfileImage1),
                ),
                const SizedBox(
                  width: TSizes.spaceBtwItems,
                ),
                Text(
                  'John Doe',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),

        //Reviews
        Row(
          children: [
            TRatingBarIndicator(rating: 4),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Text(
              '01 Nov 2023',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        ReadMoreText(
          'The user interface of this app is quite intuitive and new. Plus its easy to use and the products are also genuine.',
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: 'Show Less',
          moreStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: TColors.primary),
          lessStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: TColors.primary),
          trimCollapsedText: 'Show More',
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),

        //COmpany Reviews
        Container(
          decoration: BoxDecoration(
            color: dark ? TColors.darkerGrey : TColors.grey,
          ),
          child: Padding(
            padding: EdgeInsets.all(TSizes.md),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Felicite', style: Theme.of(context).textTheme.titleMedium,),
                  Text('02 Nov 2023', style: Theme.of(context).textTheme.bodyMedium,),
                ],
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              ReadMoreText(
                'Thank You for the Review we will continue to do our best in providing you the most perfect service and UI experiece.x',
                trimLines: 2,
                trimMode: TrimMode.Line,
                trimExpandedText: 'Show Less',
                moreStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: TColors.primary),
                lessStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: TColors.primary),
                trimCollapsedText: 'Show More',
              ),
            ]
            ),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwSections,)
      ],
    );
  }
}
