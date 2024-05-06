import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/personalization/controllers/controllers/user_controller.dart';
import 'package:t_store/utils/helpers/helper_functions.dart';

import '../../../features/personalization/screens/profile/profile.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../images/T_circular_image.dart';


class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({
    super.key, required this.onPressed,
  });
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    final dark = THelperFunctions.isDarkMode(context);
    final user = controller.user.value; // Get the actual UserModel object
    return ListTile(
      leading: const TCircularImage(
        image: TImages.user,
        width: 50,
        height: 50,
        padding: 0,
      ),
      title: Text(
        user.firstName ?? '',
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: dark ? TColors.white : TColors.black),
      ),
      subtitle: Text(
        user.email ?? '',
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .apply(color: dark ? TColors.white : TColors.black),
      ),
      trailing: IconButton(
          onPressed: onPressed,
          icon: Icon(Iconsax.edit, color: dark? TColors.white: TColors.dark)),
    );
  }
}
