// services/auth_service.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/auth_data/firebase_data.dart';
import '../../presentation/constants/colors.dart';
import '../models/user_model.dart';

class AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  //init firabse data
  final FirebaseData userData = FirebaseData();

  //signUp functionality

  Future<UserCredential?> signUpServices(
    String userName,
    String userEmail,
    String userPhone,
    String userCity,
    String userPassword,
  ) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: userEmail,
        password: userPassword,
      );

      UserModel userModel = UserModel(
        uId: userCredential.user!.uid,
        username: userName,
        email: userEmail,
        phone: userPhone,
        userImg: '',
        country: '',
        userAddress: '',
        street: '',
        createdOn: DateTime.now(),
        city: userCity,
      );

      // Add data to Firestore using the Data Layer
      await userData.addUserToFirestore(userModel);

      return userCredential;
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        'Error',
        "$e",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: red,
        colorText: white,
      );
      return null;
    }
  }

  // sign in functionality

  Future<UserCredential?> signInServices(
      String userEmail, String userPassword) async {
    try {
      UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
        email: userEmail,
        password: userPassword,
      );
      final FirebaseData fetchUsersData = FirebaseData();

      await fetchUsersData
          .fetchUserFromFIrestore(firebaseAuth.currentUser!.uid);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      // Provide specific messages based on the error code

      if (e.code == 'user-not-found') {
        Get.snackbar(
          'Error',
          'No user found for that email.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } else if (e.code == 'wrong-password') {
        Get.snackbar(
          'Error',
          'Wrong password provided for that user.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } else if (e.code == 'invalid-email') {
        Get.snackbar(
          'Error',
          'The email address is not valid.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      } else {
        Get.snackbar(
          'Error',
          'An unknown error occurred.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }

      print("Error in sign Services fetching user data${e}");
    }
  }

  Future<void> forgotPasswordService(String userEmail) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: userEmail);
    } catch (e) {
      print("error in the auth servire $e");
    }
  }
}
