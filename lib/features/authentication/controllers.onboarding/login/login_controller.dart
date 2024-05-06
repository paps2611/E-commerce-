import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:t_store/data/repo/authentication_repository.dart';

import '../../../../navigation_menu.dart';

class LoginController extends GetxController {
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  // Function to handle email and password sign-in
  Future<void> signInWithEmailAndPassword() async {
    try {
      if (loginFormKey.currentState!.validate()) {
        // Validation passed, proceed with sign-in
        final String emailValue = email.text.trim();
        final String passwordValue = password.text.trim();

        // Sign in with email and password
        await _auth.signInWithEmailAndPassword(
          email: emailValue,
          password: passwordValue,
        );

        // Save remember me status and email to shared preferences
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool('loggedIn', true);

        // Navigate to the home screen or any other screen
        // Replace NavigationMenu() with the desired destination
        Get.off(() => const NavigationMenu());
      }
    } catch (e) {
      // Handle any errors here
      print('Error occurred during sign-in: $e');
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        const SnackBar(
          content: Text('Email and Password Combination is wrong.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  //Function to handle google sign in Method
  Future<void> googleSignIn() async {
    try {
      // Start Loading
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        const SnackBar(
          content: Text('Logging You In...'),
          backgroundColor: Colors.green,
        ),
      );
      //Google Authentication
      final userCredential = await signInWithGoogle();
      // If authentication is successful,navigate to the desired screen
      if (userCredential != null) {
        Get.off(() => const NavigationMenu());
      } else {
        // Handle sign-in failure
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          const SnackBar(
            content: Text('Google sign-in failed.'),
            backgroundColor: Colors.red,
          ),
        );
      }

    } catch (e) {
      // Handle any errors
      print('Error occurred during Google sign-in: $e');
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        const SnackBar(
          content: Text('Oh Snap! Something went wrong.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

// Function to handle Google sign-in using Firebase Authentication
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the Google Sign In flow
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        // Obtain the GoogleSignInAuthentication object
        final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

        // Create a new credential
        final OAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        // Sign in to Firebase with the Google credentials
        return await FirebaseAuth.instance.signInWithCredential(credential);
      } else {
        // User canceled the sign-in process
        print('Google sign-in aborted');
        return null;
      }
    } catch (e) {
      // Handle any errors
      print('Error occurred during Google sign-in: $e');
      return null;
    }
  }

  // Function to initialize controller
  @override
  void onInit() async {
    // Check if user is already logged in
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // final bool loggedIn = prefs.getBool('loggedIn') ?? false;
    // if (loggedIn) {
    //   // Navigate to the home screen or any other screen
    //   Get.off(() => const NavigationMenu());
    // }

    super.onInit();
  }

  // Function to dispose of controllers
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
