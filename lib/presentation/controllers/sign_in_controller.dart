/* import 'package:bloc_architecture_flutter/services/auth_service/auth_service.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  final AuthService authService = AuthService();

  //for password visibility
  final isPasswordVisible = false.obs;

  Future<void> loginUser(String userEmail, String userPassword) async {
    await authService.signInServices(
      userEmail,
      userPassword,
    );
  }
}
 */
import 'package:bloc_architecture_flutter/services/auth_service/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  final AuthService authService = AuthService();

  // For password visibility
  final isPasswordVisible = false.obs;

  Future<bool> loginUser(String userEmail, String userPassword) async {
    // Attempt to log in the user
    UserCredential? userCredential = await authService.signInServices(
      userEmail,
      userPassword,
    );

    // Check if the user is successfully authenticated
    if (userCredential != null) {
      return true; // Login was successful
    } else {
      return false; // Login failed
    }
  }

  // Method to toggle password visibility
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }
}
