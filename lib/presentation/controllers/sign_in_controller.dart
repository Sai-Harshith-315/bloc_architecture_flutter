import 'package:bloc_architecture_flutter/services/auth_service/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  final AuthService authService = AuthService();

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

  // Observables for form fields
  var email = ''.obs;
  var password = ''.obs;
  // Error messages for validation
  var emailError = ''.obs;
  var passwordError = ''.obs;
  // For password visibility
  final isPasswordVisible = false.obs;

  // Validation logic for email
  void validateEmail(String value) {
    if (value.isEmpty) {
      emailError.value = 'Email cannot be empty';
    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      emailError.value = 'Please enter a valid email';
    } else {
      emailError.value = '';
    }
  }

  // Validation logic for password
  void validatePassword(String value) {
    if (value.isEmpty) {
      passwordError.value = 'Password cannot be empty';
    } else if (value.length < 6) {
      passwordError.value = 'Password must be at least 6 characters long';
    } else {
      passwordError.value = '';
    }
  }

  // Method to toggle password visibility
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }
}
