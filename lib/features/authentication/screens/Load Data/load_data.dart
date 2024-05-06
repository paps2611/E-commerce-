import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appbar/appbar.dart';

import '../../../../common/widgets/list_Tiles/settings_menu_tile.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/sizes.dart';

class LoadDataScreen extends StatelessWidget {
  const LoadDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Upload Data'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  //ACCOUNT SETTINGS
                  const TSectionHeading(
                    title: "Main Record",
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),

                  TSettingMenuTile(
                    icon: Iconsax.document_upload,
                    title: 'Upload Categories',
                    subtitle: '',
                    onTap: () => Get.to(() => const ()),
                  ),
                  TSettingMenuTile(
                    icon: Icons.upload,
                    title: 'Upload Brands',
                    subtitle: '',
                    onTap: () => Get.to(() => const ()),
                  ),
                  TSettingMenuTile(
                    icon: Iconsax.tag,
                    title: 'Upload Products',
                    subtitle: '',
                    onTap: () => Get.to(() => const ()),
                  ),
                  TSettingMenuTile(
                    icon: Icons.post_add,
                    title: 'Upload Banners',
                    subtitle: '',
                    onTap: () {},
                  ),

                  //APP SETTINGS
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  const TSectionHeading(
                    title: 'Relationship',
                    showActionButton: false,
                  ),
                  Text(
                      'Make sure You have already uploaded the above contents.'),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  TSettingMenuTile(
                    icon: Icons.sync_sharp,
                    title: "Upload Brands & Categories Relation Data",
                    subtitle: "",
                    onTap: () {},
                  ),
                  TSettingMenuTile(
                    icon: Icons.sync_alt,
                    title: "Upload Product & Categories Relation Data",
                    subtitle: "",
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
