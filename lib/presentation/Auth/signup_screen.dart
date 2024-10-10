import 'package:bloc_architecture_flutter/presentation/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/sign_up_controller.dart';
import '../constants/colors.dart';
import '../constants/responsive.dart';
import '../widgets/my_textFormField.dart';
import '../widgets/my_text_wiget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final SignUpController signUpController = Get.put(SignUpController());
  TextEditingController userNameController = TextEditingController();
  TextEditingController userEmailController = TextEditingController();
  TextEditingController userPhoneController = TextEditingController();
  TextEditingController userPasswordController = TextEditingController();
  TextEditingController userConfirmPasswordController = TextEditingController();
  TextEditingController userAddressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        body: SingleChildScrollView(
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: Responsive.isDesktop(context) ||
                        Responsive.isDesktopLarge(context)
                    ? MediaQuery.of(context).size.width * .32
                    : Responsive.isTablet(context)
                        ? MediaQuery.of(context).size.width * .5
                        : Responsive.isMobileLarge(context)
                            ? MediaQuery.of(context).size.width * .7
                            : MediaQuery.of(context).size.width * .9,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: MyText(
                              text: 'Welcome',
                              fontWeight: FontWeight.w600,
                              fontSize: 30,
                              color: black,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: MyText(
                              text:
                                  "Lets's get started by filling out of the form below",
                              color: grey,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextFormField(
                      controller: userNameController,
                      hintText: 'Name',
                      labelText: 'Name',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFormField(
                      controller: userEmailController,
                      hintText: 'Eamil Address',
                      labelText: 'Eamil Address',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFormField(
                      controller: userPasswordController,
                      hintText: 'Password',
                      labelText: 'Password',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFormField(
                      controller: userConfirmPasswordController,
                      hintText: 'Confirm Password',
                      labelText: 'Confirm Password',
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        try {
                          if (userNameController.text != '' &&
                              userEmailController.text != '' &&
                              userPhoneController != '' &&
                              userAddressController != '' &&
                              userPasswordController != '') {
                            signUpController.signUpUser(
                              userNameController.text.trim(),
                              userEmailController.text.trim(),
                              userPhoneController.text.trim(),
                              userAddressController.text.trim(),
                              userPasswordController.text.trim(),
                            );
                            Get.snackbar(
                              backgroundColor: green,
                              'Successfully Login',
                              '${userNameController.text} - welcome to VAVFOODS',
                              colorText: white,
                            );
                            Get.to(() => MainScreen());
                          }
                        } catch (e) {
                          print('Error in the signup screen $e');
                          Get.snackbar(
                            backgroundColor: red,
                            'Error',
                            'Error in the signup screen $e',
                            colorText: white,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 20),
                        backgroundColor: greencolor,
                      ),
                      child: MyText(
                        text: 'Create Account',
                        color: white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
