// services/auth_service.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../data/firebase_data.dart';
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
      final FirebaseData fetchUsersData = FirebaseData();
      UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
        email: userEmail,
        password: userPassword,
      );
      await fetchUsersData
          .fetchUserFromFIrestore(firebaseAuth.currentUser!.uid);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      print("Error in sign Services fetching user data${e}");
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

  Future<void> forgotPasswordService(String userEmail) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: userEmail);
    } catch (e) {
      print("error in the auth servire $e");
    }
  }
}
