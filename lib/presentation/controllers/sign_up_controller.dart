// presentation/controllers/sign_up_controller.dart
import 'package:get/get.dart';
import '../../services/auth_service/auth_service.dart';

class SignUpController extends GetxController {
  final AuthService authService = AuthService();

  Future<void> signUpUser(
    String userName,
    String userEmail,
    String userPhone,
    String userCity,
    String userPassword,
  ) async {
    await authService.signUpServices(
      userName,
      userEmail,
      userPhone,
      userCity,
      userPassword,
    );
  }

  // Observables for form fields
  var name = ''.obs;
  var email = ''.obs;
  var phone = ''.obs;
  var password = ''.obs;
  var confirmPassword = ''.obs;

  // Error messages for validation
  var nameError = ''.obs;
  var emailError = ''.obs;
  var phoneError = ''.obs;
  var passwordError = ''.obs;
  var confirmPasswordError = ''.obs;

  // Observable for password visibility toggle
  var isPasswordVisible = false.obs;
  var isConfirmPasswordVisible = false.obs;

  // Validation logic for name
  void validateName(String value) {
    if (value.isEmpty) {
      nameError.value = 'Name cannot be empty';
    } else {
      nameError.value = '';
    }
  }

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

  // Validation logic for phone number
  void validatePhone(String value) {
    if (value.isEmpty) {
      phoneError.value = 'Phone number cannot be empty';
    } else if (!RegExp(r'^[6789]\d{9}$').hasMatch(value)) {
      phoneError.value =
          'Phone number must start with 6, 7, 8, or 9 and be 10 digits long';
    } else {
      phoneError.value = '';
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
    validateConfirmPassword(confirmPassword.value);
  }

  // Validation logic for confirm password
  void validateConfirmPassword(String value) {
    if (value.isEmpty) {
      confirmPasswordError.value = 'Confirm Password cannot be empty';
    } else if (value != password.value) {
      confirmPasswordError.value = 'Passwords do not match';
    } else {
      confirmPasswordError.value = '';
    }
  }

  // Toggle password visibility
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  // Toggle confirm password visibility
  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }
}
