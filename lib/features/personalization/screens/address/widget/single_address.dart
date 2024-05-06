import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

class TSingleAddress extends StatelessWidget {
  const TSingleAddress({super.key, required this.selected_Address});

  final bool selected_Address;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.all(TSizes.md),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(
            color: selected_Address
                ? Colors.transparent
                : dark
                    ? TColors.darkerGrey
                    : TColors.grey),
        color: selected_Address
            ? TColors.primary.withOpacity(0.5)
            : Colors.transparent,
      ),
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(
              selected_Address ? Iconsax.tick_circle5 : null,
              color: selected_Address
                  ? dark
                      ? TColors.light
                      : TColors.dark.withOpacity(0.8)
                  : null,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('John Doe',maxLines: 2,overflow: TextOverflow.ellipsis,style: Theme.of(context).textTheme.titleLarge,),
              const SizedBox(height: TSizes.sm/2,),
              Text('+91-9313681006',maxLines: 1,overflow: TextOverflow.ellipsis,),
              const SizedBox(height: TSizes.sm/2,),
              Text('GreenMansion MigsunGreen, Zeta-I, Greater Noida, India',
                softWrap: true,
              ),

            ],
          ),
        ],
      ),
    );
  }
}
