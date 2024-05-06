import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/personalization/controllers/controllers/user_controller.dart';
import 'package:t_store/features/personalization/screens/profile/profile.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/popups/animation_loader.dart';
import 'package:t_store/utils/popups/fullscreen_loader.dart';

import '../../../../data/repo/authentication_repository.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final AuthenticationRepository _authRepository = AuthenticationRepository();
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializeName();
    super.onInit();
  }

  Future<void> initializeName() async {
    if (userController.user.value != null) {
      firstName.text = userController.user.value.firstName ?? '';
      lastName.text = userController.user.value.lastName ?? '';
    }
  }

  Future<void> updateUserName() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'we are updating your info', TImages.userProfileImage1);

      final isConnected = await _authRepository.checkInternetConnectivity();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        Get.snackbar('Error', 'No internet connection');
        return;
      }

      if (!updateUserNameFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (userController.user.value.userID == null) {
        TFullScreenLoader.stopLoading();
        Get.snackbar('Error', 'User ID is null');
        return;
      }

      String userId = userController.user.value.userID!;

      String newFirstName = firstName.text.trim();
      String newLastName = lastName.text.trim();

      // Update first name
      await _authRepository.updateFieldInUserData(
          userId: userId, fieldName: 'firstName', newValue: newFirstName);

      // Update last name
      await _authRepository.updateFieldInUserData(
          userId: userId, fieldName: 'lastName', newValue: newLastName);


      // Remove loader
      TFullScreenLoader.stopLoading();

      // Show success message
      Get.snackbar('Congratulations', 'Your information has been updated');

      // Move to the previous screen
      Get.off(() => const ProfileScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      Get.snackbar('Error', 'Failed to update information: $e');
    }
  }
}