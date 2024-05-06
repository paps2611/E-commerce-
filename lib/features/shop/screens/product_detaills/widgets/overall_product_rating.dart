import 'package:flutter/material.dart';
import 'package:t_store/features/shop/screens/product_reviews/widget/progress_indicator.dart';


class TOverallProductRating extends StatelessWidget {
  const TOverallProductRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            '4.8',
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        const Expanded(
          flex: 7,
          child: Column(
            children: [
              TRatingProgressIndicator(value: 1.0, text: '5'),
              SizedBox(height: 4), // Add space between indicators
              TRatingProgressIndicator(value: 0.8, text: '4'),
              SizedBox(height: 4), // Add space between indicators
              TRatingProgressIndicator(value: 0.6, text: '3'),
              SizedBox(height: 4), // Add space between indicators
              TRatingProgressIndicator(value: 0.4, text: '2'),
              SizedBox(height: 4), // Add space between indicators
              TRatingProgressIndicator(value: 0.2, text: '1'),
            ],
          ),
        ),
      ],
    );
  }
}
