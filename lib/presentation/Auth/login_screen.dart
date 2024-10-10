import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/responsive.dart';
import '../widgets/my_textFormField.dart';
import '../widgets/my_text_wiget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                // maxHeight: MediaQuery.of(context).size.height * .5,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: MyText(
                          text: 'Welcome Back!',
                          fontSize: 30,
                          color: black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextFormField(
                      hintText: 'Eamil Address',
                      labelText: 'Eamil Address',
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextFormField(
                      hintText: 'Password',
                      labelText: 'Password',
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: MyText(
                          text: 'Forgot Password ?',
                          color: greencolor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Get.toNamed(AppRoutes.homeScreen);
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: /* Responsive.isDesktop(context) ||
                                    Responsive.isDesktopLarge(context)
                                ? 30
                                : */
                                50,
                            vertical: 20),
                        backgroundColor: greencolor,
                      ),
                      child: MyText(
                        text: 'Login',
                        fontSize: Responsive.isDesktop(context) ||
                                Responsive.isDesktopLarge(context)
                            ? 16
                            : 14,
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
