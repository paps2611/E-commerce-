import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TOrdersListItem extends StatelessWidget {
  const TOrdersListItem({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 10,
      separatorBuilder: (_,__)=> const SizedBox(height: TSizes.spaceBtwItems,),
      itemBuilder: (_,index)=>Container(
        decoration: BoxDecoration(
          color: dark ? TColors.dark : TColors.light,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: TColors.borderPrimary,
          ),
        ),
        padding: const EdgeInsets.all(TSizes.md),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                //Icons
                Icon(Iconsax.ship),
                SizedBox(
                  width: TSizes.spaceBtwItems/2,
                ),
      
                //STATUS AND DATE
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Processing',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .apply(color: TColors.primary, fontWeightDelta: 1),
                      ),
                      Text('07 APRIL 2024',style: Theme.of(context).textTheme.headlineSmall,),
                    ],
                  ),
                ),
      
                //ICONBUTTON
                IconButton(onPressed: (){}, icon: Icon(Iconsax.arrow_right_34,size: TSizes.iconSm,)),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwItems,),
            //ROW 2
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      //Icons
                      Icon(Iconsax.tag),
                      SizedBox(
                        width: TSizes.spaceBtwItems/2,
                      ),
                  
                      //STATUS AND DATE
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Order',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                            ),
                            Text('[#2131f4]',style: Theme.of(context).textTheme.titleMedium,),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      //Icons
                      Icon(Iconsax.calendar),
                      SizedBox(
                        width: TSizes.spaceBtwItems/2,
                      ),
      
                      //STATUS AND DATE
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                'Shipping Date',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                            ),
                            Text('04 April 2024',style: Theme.of(context).textTheme.labelMedium,),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
