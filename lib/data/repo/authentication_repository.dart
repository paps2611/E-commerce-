import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:t_store/features/authentication/screens/login/login.dart';
import 'package:t_store/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:t_store/utils/exceptions/firebase_exceptions.dart';
import 'package:t_store/utils/exceptions/format_exceptions.dart';
import 'package:t_store/utils/exceptions/platform_exceptions.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //variables
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  //Get authenticated user data
  User? get authUser => _auth.currentUser;

  User? currentUser() {
    return _auth.currentUser;
  }

  @override
  void onReady() {
    FlutterNativeSplash.remove();
  }

  Future<void> updateUserData({
    required String userId,
    required Map<String, dynamic> updatedData,
  }) async {
    try {
      // Get a reference to the document containing the user data
      DocumentReference<Map<String, dynamic>> userRef =
          _firestore.collection('users').doc(userId);

      // Update the document with the new data
      await userRef.update(updatedData);
    } catch (e) {
      rethrow; // You may want to handle this error in your controller
    }
  }

  Future<void> updateFieldInUserData({
    required String userId,
    required String fieldName,
    required dynamic newValue,
  }) async {
    try {
      // Get a reference to the document containing the user data
      DocumentReference<Map<String, dynamic>> userRef =
          _firestore.collection('users').doc(userId);

      // Update the specific field with the new value
      await userRef.update({fieldName: newValue});
    } catch (e) {
      rethrow; // You may want to handle this error in your controller
    }
  }

  Future<UserCredential> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      // Check internet connectivity before proceeding
      if (await checkInternetConnectivity()) {
        // Internet connectivity available, proceed with login
        return await _auth.signInWithEmailAndPassword(
            email: email, password: password);
      } else {
        // No internet connectivity, handle accordingly
        throw 'No internet connection available';
      }
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on TPlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (_) {
      throw 'Something went wrong. Please try again!';
    }
  }

  Future<UserCredential> registerWithEmailAndPassword({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String username,
  }) async {
    try {
      // Check internet connectivity before proceeding
      if (await checkInternetConnectivity()) {
        // Internet connectivity available, proceed with registration
        return await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
      } else {
        // No internet connectivity, handle accordingly
        throw 'No internet connection available';
      }
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on TPlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (_) {
      throw 'Something went wrong. Please try again!';
    }
  }

  //Logout
  Future<void> logout() async {
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      await GetStorage().erase();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong,Please try again';
    }
  }

  //REset Password
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on TPlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (_) {
      throw 'Something went wrong. Please try again!';
    }
  }

  //EMAIL VERIFICATION
  Future<void> sendEmailVerification() async {
    try {
      // Check internet connectivity before proceeding
      if (await checkInternetConnectivity()) {
        // Internet connectivity available, proceed with sending email verification
        await _auth.currentUser?.sendEmailVerification();
      } else {
        // No internet connectivity, handle accordingly
        throw 'No internet connection available';
      }
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong,Please try again';
    }
  }

  //Google Sign In Authentication
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Check internet connectivity before proceeding
      if (await checkInternetConnectivity()) {
        // Internet connectivity available, proceed with Google sign-in
        final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
        final GoogleSignInAuthentication? googleAuth =
            await userAccount?.authentication;
        final credentials = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );
        return await _auth.signInWithCredential(credentials);
      } else {
        // No internet connectivity, handle accordingly
        throw 'No internet connection available';
      }
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong,Please try again';
    }
  }

  Future<bool> checkInternetConnectivity() async {
    try {
      var connectivityResult = await Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        // No internet connection
        return false;
      } else {
        // Internet connection is available
        return true;
      }
    } catch (e) {
      // Error occurred while checking connectivity
      return false; // Assume no internet connection in case of error
    }
  }

  // Method to remove a user's record from Firestore
  Future<void> removeUserData({
    required String userId,
  }) async {
    try {
      // Get a reference to the document containing the user data
      DocumentReference<Map<String, dynamic>> userRef =
          _firestore.collection('users').doc(userId);

      // Delete the document
      await userRef.delete();
    } catch (e) {
      rethrow; // You may want to handle this error in your controller
    }
  }

  // Method to fetch user data from Firestore
  Future<Map<String, dynamic>?> getUserData(String userId) async {
    try {
      // Get a reference to the document containing the user data
      DocumentSnapshot<Map<String, dynamic>> snapshot =
          await _firestore.collection('users').doc(userId).get();

      // Check if the document exists
      if (snapshot.exists) {
        // Extract user data from the document
        Map<String, dynamic>? userData = snapshot.data();

        return userData;
      } else {
        // User data not found
        return null;
      }
    } catch (e) {
      return null;
    }
  }
  Future<String> uploadImage(String path, XFile image) async {
    try {
      final ref = FirebaseStorage.instance.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on TPlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (_) {
      throw 'Something went wrong. Please try again!';
    }
  }

  Future<void> saveUserDataToFirestore({
    required String username,
    required String userId,
    required String firstName,
    required String lastName,
    required String email,
    required String phoneNumber,
  }) async {
    try {
      await _firestore.collection('users').doc(userId).set({
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'phoneNumber': phoneNumber,
        'profilePic': '',
        'userName': username,
        'userID': userId,
        // Add more fields as needed
      });
    } catch (e) {
      rethrow; // You may want to handle this error in your controller
    }
    //Upload any image

    }
  }
