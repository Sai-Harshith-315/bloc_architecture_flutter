import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../services/auth_service/auth_service.dart';

class ForgotPasswordController extends GetxController {
  //for password visibility
  final isPasswordVisible = false.obs;
  final AuthService firebaseAuth = AuthService();

  Future<void> forgotPassword(String userEmail) async {
    try {
      await firebaseAuth.forgotPasswordService(userEmail);
      Get.snackbar('Send', 'Verification Mail was sent');
    } on FirebaseAuthException catch (e) {
      print('Error: in the forgot password controller $e');
    }
  }
}
