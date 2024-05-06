import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/shop/screens/product_reviews/widget/user_review_card.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../product_detaills/widgets/overall_product_rating.dart';
import 'widget/ratingbar_indicator.dart';

class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: dark ? TColors.dark : TColors.light,
        title: Text(
          'Reviews & Rating',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(
          color: dark ? TColors.white : TColors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  'Rating and Reviews are verified and are from the people who use the same type of device that you use'),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              //overall product review
              const TOverallProductRating(),
              const TRatingBarIndicator(rating: 3.5,),
              Text('12,611',style: Theme.of(context).textTheme.bodySmall,),
              const SizedBox(height: TSizes.spaceBtwSections,),

              //User Reivew LIst
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),

            ],
          ),
        ),
      ),
    );
  }
}
