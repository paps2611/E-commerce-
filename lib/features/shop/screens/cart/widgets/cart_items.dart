import 'package:flutter/material.dart';

import '../../../../../common/widgets/cart/add_remove_butto.dart';
import '../../../../../common/widgets/cart/cart_item.dart';
import '../../../../../common/widgets/texts/price_tag.dart';
import '../../../../../utils/constants/sizes.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({super.key,
    this.showAddRemoveButtons = true,
  });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) => SizedBox(
        height: TSizes.spaceBtwSections,
      ),
      itemCount: 2,
      itemBuilder: (_, index) => Column(
        children: [
          TCartItem(),
          if(showAddRemoveButtons)SizedBox(height: TSizes.spaceBtwItems,),

          //ADD REMOVE BUTTON WITH PRICE
          if(showAddRemoveButtons)
            const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 70,
                  ),
                  //ADD REMOVE BUTTON
                  TProductQualityAddRemoveButton(),
                ],
              ),
              //TOTAL PRICE TAG
              TproductPriceTag(price: '256'),
            ],
          ),
        ],
      ),
    );
  }
}
