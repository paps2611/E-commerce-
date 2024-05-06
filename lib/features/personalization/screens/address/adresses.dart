import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/personalization/screens/address/add_new_adressess.dart';
import 'package:t_store/features/personalization/screens/address/widget/single_address.dart';
import 'package:t_store/utils/constants/colors.dart';
import 'package:t_store/utils/constants/sizes.dart';

import '../../../../../common/widgets/appbar/appbar.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: ()=> Get.to(()=> const AddNewAddressScreen()),
      child:const Icon(Iconsax.add, color: Colors.white,),
        backgroundColor: TColors.primary,
      ),
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Address',style: Theme.of(context).textTheme.headlineSmall,),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
                TSingleAddress(selected_Address: false),
                TSingleAddress(selected_Address: true ),
            ],
          ),
        ),
      ),
    );
  }
}
