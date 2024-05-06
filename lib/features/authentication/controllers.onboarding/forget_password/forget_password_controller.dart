import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repo/authentication_repository.dart';
import 'package:t_store/features/authentication/screens/forgot_password/reset_password.dart';
import 'package:t_store/utils/popups/fullscreen_loader.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  //
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  //send Reset Password Email
  sendPasswordResetEmail() async {
    try {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        const SnackBar(
          content: Text('Processing your Request...'),
          backgroundColor: Colors.green,
        ),
      );
      if (!forgetPasswordFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(
          email.text.trim());

      //remove user
      TFullScreenLoader.stopLoading();

      //show SuccessScreen
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        const SnackBar(
          content: Text('Email Sent.'),
          backgroundColor: Colors.green,
        ),
      );

      //redirect 
      Get.to(() => ResetPassword(email: email.text.trim()));
    } catch (e) {
      TFullScreenLoader.stopLoading();
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        const SnackBar(
          content: Text('Oh Snap!'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        const SnackBar(
          content: Text('Processing your Request...'),
          backgroundColor: Colors.lightGreen,
        ),
      );

      await AuthenticationRepository.instance.sendPasswordResetEmail(
          email);

      //remove user
      TFullScreenLoader.stopLoading();

      //show SuccessScreen
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        const SnackBar(
          content: Text('Email Sent.'),
          backgroundColor: Colors.green,
        ),
      );

    } catch (e) {
      TFullScreenLoader.stopLoading();
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        const SnackBar(
          content: Text('Oh Snap!'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}