import 'package:bloc_architecture_flutter/services/auth_service/auth_service.dart';
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
