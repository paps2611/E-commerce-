import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helper_functions.dart';
import '../icons/tcircular_cion.dart';


class TProductQualityAddRemoveButton extends StatelessWidget {
  const TProductQualityAddRemoveButton({
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      children: [
        //ADD REMOVE BUTTON
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            TCircularIcon(icon: Iconsax.minus,
              width: 32,
              height: 32,
              size: TSizes.md,
              color: dark ? TColors.white : TColors.black,
              backgroundColor: dark ? TColors.darkerGrey : TColors.light,
            ),
            const SizedBox(width: TSizes.spaceBtwItems,),
            Text('2',style: Theme.of(context).textTheme.titleSmall,),
            const SizedBox(width: TSizes.spaceBtwItems,),
            TCircularIcon(icon: Iconsax.add,
              width: 32,
              height: 32,
              size: TSizes.md,
              color:TColors.white,
              backgroundColor: TColors.primary,
            ),
          ],
        ),
      ],
    );
  }
}
