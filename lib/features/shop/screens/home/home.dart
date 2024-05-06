import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/layout/grid_layout.dart';
import 'package:t_store/common/widgets/products/product_card_vertical.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/personalization/controllers/controllers/user_controller.dart';
import 'package:t_store/features/shop/screens/cart/cart.dart';
import 'package:t_store/features/shop/screens/home/widget/home_categories.dart';
import 'package:t_store/features/shop/screens/home/widget/promo_slider.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/constants/text_strings.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/search_container.dart';
import '../all_products/all_produts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final controller =Get.put(UserController());
    final darkMode = THelperFunctions.isDarkMode(context);

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF2196F3),
        elevation: 0, // Remove app bar elevation
        title: Center(

          child: Row(
            children: [
              Image.asset('assets/logos/felicitedarklogo.png'
                , // Choose an appropriate icon
                color: darkMode ? TColors.white : TColors.dark,
                width: 88,
                height: 88,// Adjust icon size
              ),
              SizedBox(width: 2), // Add some space between icon and text
              Text(
                'FELICITE',
                style: TextStyle(
                  color: darkMode ? TColors.white : TColors.dark,
                  fontWeight: FontWeight.bold,
                  fontSize: 24, // Adjust title font size
                  fontFamily: 'Montserrat', // Optional: Apply a stylish font
                  letterSpacing: 5, // Add some letter spacing for better readability
                  shadows: [
                    Shadow(
                      blurRadius: 2,
                      color: darkMode ? Colors.black.withOpacity(0.5) : Colors.grey.withOpacity(0.5),
                      offset: Offset(1, 1),
                    ),
                  ],
                ),
              ),
            ],
          ),

        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Iconsax.shopping_bag),
            onPressed: () => Get.to(()=> const CartScreen()),
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.7, // Adjust height
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF2196F3), // Start color (more blue)
                  Color(0xFF0D47A1), // End color (less blue)
                ],
                stops: [0.0, 1.0], // Stops for the upper gradient
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.28,//djust position
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.4, // Adjust height
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: darkMode
                      ? [Colors.black, Colors.black] // Start color (black)
                      : [Colors.white, Colors.white], // Start color (white)
                  stops: [0.0, 1.0], // Stops for the lower gradient
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const TSearchContainer(
                  text: 'Search in Store',
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: TSizes.defaultSpace),
                  child: Column(
                    children: [
                      TSectionHeading(
                        title: 'Popular Categories',
                        showActionButton: false,
                      ),
                      SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      //categories
                      THomeCategories(),
                    ],
                  ),
                ),
                SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                ///body
                Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: Column(
                    children: [
                      ///Promo Slider Carousal
                      const TPromoSlider(
                        banners: [
                          TImages.promoBanner1,
                          TImages.promoBanner2,
                          TImages.promoBanner3,
                        ],
                      ),
                      const SizedBox(height: TSizes.spaceBtwSections,),

                      TSectionHeading(
                        title: 'Popular Products',
                        showActionButton: true,
                        onPressed: ()=> Get.to(()=> const AllProducts()),
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems,),
                      //Popular Products--
                      TGridLayout(
                        itemCount: 4,
                        itemBuilder: (_, index) => const TProductCardVertical(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
