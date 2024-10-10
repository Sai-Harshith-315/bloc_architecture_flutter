import 'package:bloc_architecture_flutter/presentation/Auth/welcome_screen.dart';
import 'package:bloc_architecture_flutter/presentation/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: user != null ? HomeScreen() : WelcomeScreen(),
    );
  }
}
