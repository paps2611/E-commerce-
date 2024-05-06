import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:t_store/data/repo/authentication_repository.dart';
import 'package:t_store/features/authentication/screens/login/login.dart';
import 'package:t_store/utils/constants/image_strings.dart';
import 'package:t_store/utils/constants/sizes.dart';
import 'package:t_store/utils/popups/fullscreen_loader.dart';

class UserModel {
  late final String? firstName;
  late final String? lastName;
  final String? email;
  final String? phoneNumber;
  final String? username;
  final String? userID;
  String? profilePic;

  UserModel({
    this.username,
    this.firstName,
    this.userID,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.profilePic,
  });

  String get fullName {
    return '${firstName ?? ''} ${lastName ?? ''}'.trim();
  }
}

class UserController extends GetxController {
  static UserController get instance => Get.find();

  //? user;
  final AuthenticationRepository _authRepository = AuthenticationRepository();
  Rx<UserModel> user = UserModel().obs;

  @override
  void onInit() {
    String userId = FirebaseAuth.instance.currentUser?.uid ?? '';
    fetchUserData(userId);
    super.onInit();
  }

  Future<void> fetchUserData(String userId) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
          .instance
          .collection('users')
          .doc(userId)
          .get();

      if (snapshot.exists) {
        Map<String, dynamic> userData = snapshot.data()!;

        user.value = UserModel(
          firstName: userData['firstName'],
          userID: userId,
          lastName: userData['lastName'],
          email: userData['email'],
          phoneNumber: userData['phoneNumber'],
          username: userData['username'],
          profilePic: userData['profilePic']

        );

        update();
      } else {
        print('User document not found in Firestore');
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      if (userCredential != null) {
        String? fullName = userCredential.user?.displayName;
        String? email = userCredential.user?.email;
        String? phoneNumber = userCredential.user?.phoneNumber;

        List<String> nameParts = fullName?.split(' ') ?? [];
        String firstName = nameParts.isNotEmpty ? nameParts.first : '';
        String lastName = nameParts.length > 1 ? nameParts.last : '';

        user.value = UserModel(
          firstName: firstName,
          lastName: lastName,
          email: email,
          phoneNumber: phoneNumber,
        );

        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user?.uid)
            .set({
          'firstName': firstName,
          'lastName': lastName,
          'email': email,
          'phoneNumber': phoneNumber,
          'fullName': fullName,
        });

        showSuccessSnackBar('User data saved successfully');
      }
    } catch (e) {
      showErrorSnackBar('Failed to save user data');
      print('Error saving user data: $e');
    }
  }

  Future<void> deleteUserAccount() async {
    try {
      TFullScreenLoader.openLoadingDialog('Processing', TImages.userProfileImage1);

      final auth = AuthenticationRepository.instance;
      final provider = auth.authUser!.providerData.map((e) => e.providerId).first;
      if(provider.isNotEmpty){
        if(provider == 'google.com'){
          await auth.signInWithGoogle();
          TFullScreenLoader.stopLoading();
          Get.offAll(()=> const LoginScreen());
        }
      }
    } catch(e) {
      TFullScreenLoader.stopLoading();
      showErrorSnackBar('Failed to delete user account');
      print('Error deleting user account: $e');
    }
  }

  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(TSizes.md),
      title: 'Delete Account',
      middleText: "Are you sure?",
      confirm: ElevatedButton(
          onPressed: () async => deleteUserAccount(), child: const Text('Delete')),
      cancel: OutlinedButton(
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
        child: const Text('Cancel'),
      ),
    );
  }

  Future<void> uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 70,
        maxHeight: 512,
        maxWidth: 512,
      );

      if (image != null) {
        TFullScreenLoader.openLoadingDialog('Uploading Profile Picture', ''); // Show loading indicator

        final imageUrl = await _authRepository.uploadImage('Users/Images/Profile/', image);

        // Update the image record in Firestore
        final userId = FirebaseAuth.instance.currentUser?.uid ?? '';
        final userRef = FirebaseFirestore.instance.collection('users').doc(userId);
        await userRef.update({'profilePic': imageUrl});

        // Update local user data
        user.update((val) {val!.profilePic = imageUrl;
        });
        user.refresh();

        // Hide loading indicator
        TFullScreenLoader.stopLoading();

        showSuccessSnackBar('Congratulations! Profile picture updated successfully!');
      }
    } catch(e) {
      TFullScreenLoader.stopLoading(); // Hide loading indicator
      showErrorSnackBar('Failed to upload profile picture');
      print('Error uploading profile picture: $e');
    }
  }



  Future<void> fetchUserProfilePicture(String userId) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshot = await FirebaseFirestore
          .instance
          .collection('users')
          .doc(userId)
          .get();

      if (snapshot.exists) {
        String? profilePic = snapshot.data()?['profilePic'];

        if (profilePic != null) {
          UserModel updatedUser = UserModel(
            firstName: user.value.firstName,
            lastName: user.value.lastName,
            email: user.value.email,
            phoneNumber: user.value.phoneNumber,
            username: user.value.username,
            userID: user.value.userID,
            profilePic: profilePic,
          );
          user.value = updatedUser;
          update();
        }
      }
    } catch (e) {
      print('Error fetching profile picture: $e');
    }
  }


  void showSuccessSnackBar(String message) {
    Get.snackbar(
      'Success',
      message,
      backgroundColor: Colors.green,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void showErrorSnackBar(String message) {
    Get.snackbar(
      'Error',
      message,
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
