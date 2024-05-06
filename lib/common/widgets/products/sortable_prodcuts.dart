import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/products/product_card_vertical.dart';

import '../../../utils/constants/sizes.dart';
import '../layout/grid_layout.dart';


class TSortableProducts extends StatelessWidget {
  const TSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //DROPDOWN
        DropdownButtonFormField(
          decoration:
          const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          onChanged: (value) {},
          items: [
            'Name',
            'HighPrice',
            'LowPrice',
            'Popularity',
            'Newest',
            'Sale'
          ]
              .map((option) =>
              DropdownMenuItem(
                  value:option,
                  child: Text(option))).toList(),
        ),
        const SizedBox(height: TSizes.spaceBtwSections,),

        // DIsplay Products
        TGridLayout(itemCount: 11, itemBuilder: (_,index)=>const TProductCardVertical())
      ],
    );
  }
}
