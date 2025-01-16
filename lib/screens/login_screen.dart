import 'package:flutter/material.dart';
import 'package:delivery_app/screens/home_screen.dart';
import 'package:delivery_app/widgets/custom_button.dart';
import 'package:delivery_app/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 500,
                height: 500,
              ),
              const SizedBox(height: 5),
              CustomTextField(
                hintText: 'Username',
                onChanged: (value) {
                  // Implement username validation
                },
              ),
              const SizedBox(height: 16),
              CustomTextField(
                hintText: 'Password',
                isPassword: true,
                onChanged: (value) {
                  // Implement password validation
                },
              ),
              const SizedBox(height: 24),
              CustomButton(
                text: 'Sign In',
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  // Implement registration navigation
                },
                child: const Text(
                  'Still not account, register here',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}