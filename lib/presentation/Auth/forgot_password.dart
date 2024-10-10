import 'package:bloc_architecture_flutter/presentation/Auth/welcome_screen.dart';
import 'package:bloc_architecture_flutter/presentation/controllers/forgot_password_controller.dart';
import 'package:bloc_architecture_flutter/presentation/widgets/my_app_bar.dart';
import 'package:bloc_architecture_flutter/presentation/widgets/my_textFormField.dart';
import 'package:bloc_architecture_flutter/presentation/widgets/my_text_wiget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController userEmailController = TextEditingController();
// init
  final ForgotPasswordController forgotPasswordController =
      Get.put(ForgotPasswordController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(title: 'Forgot Password'),
      body: Column(
        children: [
          MyText(text: 'Enter Your Mail For Reset your passsword'),
          CustomTextFormField(
            controller: userEmailController,
            hintText: 'Enter Eamil',
            labelText: 'Email',
          ),
          ElevatedButton(
            onPressed: () {
              final String userEmail = userEmailController.text.trim();

              if (userEmail != '') {
                forgotPasswordController.forgotPassword(userEmail);
                userEmailController.clear();
                Get.to(() => WelcomeScreen());
              } else {
                Get.snackbar('Error', 'Please Enter Your Email');
              }
            },
            child: MyText(text: 'Send'),
          ),
        ],
      ),
    );
  }
}
