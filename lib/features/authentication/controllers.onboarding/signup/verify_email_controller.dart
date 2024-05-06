import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/success_screen/success_screen.dart';
import 'package:t_store/features/authentication/screens/login/login.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/text_strings.dart';

import '../../../../data/repo/authentication_repository.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

//SEND EMAL VERIFICATION LINK
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        const SnackBar(
          content: Text('Email Sent! Please Check Your Inbox and verify.'),
          backgroundColor: Colors.lightGreen,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        const SnackBar(
          content: Text('Oh Snap!'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

//TIMER TO AUTOMATICALLY REDIRECT TO ON EMAIL VERIFICATION
    setTimerForAutoRedirect() {
      Timer.periodic(const Duration(seconds: 1), (timer) async {
        await FirebaseAuth.instance.currentUser?.reload();
        final user = FirebaseAuth.instance.currentUser;
        if (user?.emailVerified ?? false) {
          timer.cancel();
          Get.off(() => SuccessScreen(
                image: 'assets/logos/Registration_success.jpg',
                title: TTexts.yourAccountCreatedTitle,
                subtitle: TTexts.yourAccountCreatedSubTitle,
                onPressed: () => const LoginScreen(),
              ));
        }
      });
    }

//MANUALLY CHECK IF VERIFIED
  checkEmailVerification() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(() => SuccessScreen(
          image: 'assets/logos/Registration_success.jpg',
          title: TTexts.yourAccountCreatedTitle,
          onPressed: () => const LoginScreen(),
          subtitle: TTexts.yourAccountCreatedSubTitle));
    }
  }
}
