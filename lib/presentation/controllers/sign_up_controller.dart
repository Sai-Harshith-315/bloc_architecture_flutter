// presentation/controllers/sign_up_controller.dart
import 'package:get/get.dart';

import '../../services/service/auth_service.dart';

class SignUpController extends GetxController {
  final AuthService authService = AuthService();

  // For password visibility
  final isPasswordVisible = false.obs;

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
}
