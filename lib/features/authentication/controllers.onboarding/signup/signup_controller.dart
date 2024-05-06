import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/success_screen/success_screen.dart';
import 'package:t_store/data/repo/authentication_repository.dart';
import 'package:t_store/features/authentication/screens/verify_email/verify_email.dart';
import 'package:t_store/utils/constants/image_strings.dart';

class SignupController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;

  final AuthenticationRepository _authRepository = AuthenticationRepository();

  Future<void> submitSignupForm() async {
    try {
      if (formKey.currentState!.validate()) {
        // All fields are valid, check privacy policy
        if (privacyPolicy.value) {
          // Privacy policy accepted, proceed with signup

          // Accessing all the field values from their respective controllers
          final firstName = firstNameController.text.trim();
          final lastName = lastNameController.text.trim();
          final username = usernameController.text.trim(); // If you need username
          final email = emailController.text.trim();
          final phoneNumber = phoneController.text.trim();
          final password = passwordController.text.trim();

          // Call your signup method from AuthenticationRepository
          final userCredential = await _authRepository.registerWithEmailAndPassword(
            email: email,
            password: password,
            firstName: firstName,
            lastName: lastName,
            username: username,
            // If you need username
            phoneNumber: phoneNumber,
          );

          // Obtain the userId from the UserCredential
          final userId = userCredential.user!.uid;

          // Save user data to Firestore
          await _authRepository.saveUserDataToFirestore(
            userId: userId, // Pass the obtained userId
            firstName: firstName,
            lastName: lastName,
            phoneNumber: phoneNumber,
            username: username,
            email: email,
            // Add more fields as needed
          );

          // Navigate to the verify email screen or any other screen
          Get.off(const VerifyEmailScreen());

          // Registration successful, show success message
          ScaffoldMessenger.of(Get.context!).showSnackBar(
            const SnackBar(
              content: Text('Registration successful'),
              backgroundColor: Colors.green,
            ),
          );
        } else {
          // Privacy policy not accepted
          ScaffoldMessenger.of(Get.context!).showSnackBar(
            const SnackBar(
              content: Text('Please Accept Privacy Policy'),
              backgroundColor: Colors.orange,
            ),
          );
        }
      } else {
        // At least one field is invalid
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          const SnackBar(
            content: Text('Please fill all required fields.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      // Handle any errors here
      print('Error occurred during signup: $e');
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        const SnackBar(
          content: Text('An error occurred during signup.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  void dispose() {
    // Dispose of all controllers when the controller is disposed.
    firstNameController.dispose();
    lastNameController.dispose();
    usernameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
