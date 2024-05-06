import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/images/T_circular_image.dart';
import 'package:t_store/common/widgets/list_Tiles/settings_menu_tile.dart';
import 'package:t_store/common/widgets/texts/section_heading.dart';
import 'package:t_store/features/authentication/screens/Load%20Data/load_data.dart';
import 'package:t_store/features/authentication/screens/login/login.dart';
import 'package:t_store/features/shop/screens/checkout/checkout.dart';
import 'package:t_store/features/shop/screens/order/order.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/list_Tiles/user_profile_tile.dart';
import '../../../../utils/constants/colors.dart';
import '../../../authentication/screens/forgot_password/forogt_password.dart';
import '../profile/profile.dart';
import '../address/adresses.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      backgroundColor: dark ? TColors.dark : TColors.light,
      appBar: TAppBar(
        title: Text(
          'Account',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TUserProfileTile(
                onPressed: () => Get.to(() => const ProfileScreen())),
            const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  //ACCOUNT SETTINGS
                  const TSectionHeading(
                    title: "Account Settings",
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),

                  TSettingMenuTile(
                    icon: Iconsax.safe_home,
                    title: 'My Address',
                    subtitle: 'Set Shopping Delivery Address',
                    onTap: () => Get.to(() => const UserAddressScreen()),
                  ),
                  TSettingMenuTile(
                    icon: Iconsax.shopping_cart,
                    title: 'My Cart',
                    subtitle: 'Add Remove Products',
                    onTap: () => Get.to(() => const CheckoutScreen()),
                  ),
                  TSettingMenuTile(
                    icon: Iconsax.bag_tick,
                    title: 'My Orders',
                    subtitle: 'InProgress and Completed Orders',
                    onTap: () => Get.to(() => const OrderScreen()),
                  ),
                  TSettingMenuTile(
                    icon: Iconsax.bank,
                    title: 'Bank Account',
                    subtitle: 'Your Bank Account Details',
                    onTap: () {},
                  ),
                  TSettingMenuTile(
                    icon: Iconsax.discount_circle,
                    title: 'My Coupons',
                    subtitle: 'Active and Used Coupons',
                    onTap: () {},
                  ),
                  TSettingMenuTile(
                    icon: Iconsax.notification,
                    title: 'My Notifications',
                    subtitle: 'Set Notifications',
                    onTap: () {},
                  ),
                  TSettingMenuTile(
                    icon: Iconsax.discount_circle,
                    title: 'Account Privacy',
                    subtitle: 'Manage account privacy and account usage',
                    onTap: () {},
                  ),

                  //APP SETTINGS
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  const TSectionHeading(
                    title: 'App Settings',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  TSettingMenuTile(
                    icon: Iconsax.document_upload,
                    title: "Load Data",
                    subtitle: "Upload Data to Cloud Firebase",
                    onTap: () => Get.to(() => const LoadDataScreen()),
                  ),
                  TSettingMenuTile(
                    icon: Iconsax.location,
                    title: "Geolocation",
                    subtitle: "Recommendations based on location",
                    trailing: Switch(
                      value: true,
                      onChanged: (value) {},
                    ),
                  ),
                  TSettingMenuTile(
                    icon: Iconsax.security_user,
                    title: "Safe MOde",
                    subtitle: "Filtered Searched Results",
                    trailing: Switch(
                      value: false,
                      onChanged: (value) {},
                    ),
                  ),
                  TSettingMenuTile(
                    icon: Iconsax.image,
                    title: "HD Image Quality",
                    subtitle: "Set Image quality to be seen",
                    trailing: Switch(
                      value: false,
                      onChanged: (value) {},
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections,),

                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () => Get.off(()=> const LoginScreen()), child: Text('Logout'))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
