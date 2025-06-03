// ignore_for_file: file_names, must_be_immutable, use_build_context_synchronously

import 'package:event_booking/constant/colors.dart';
import 'package:event_booking/provider/auth_provider/auth-provider.dart';
import 'package:event_booking/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      backgroundColor: AllColors.teal50,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // App Name
              Text(
                '🎟️ EventVerse',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AllColors.teal800,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Your gateway to unforgettable experiences!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),

              const SizedBox(height: 40),

              // Email Field
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  prefixIcon: const Icon(Icons.email_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: AllColors.white,
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),

              // Password Field
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: "Password",
                  prefixIcon: const Icon(Icons.lock_outline),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  filled: true,
                  fillColor: AllColors.white,
                ),
                obscureText: true,
              ),

              const SizedBox(height: 20),

              // Login Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    if (emailController.text.isEmpty ||
                        passwordController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Please enter email and password"),
                        ),
                      );
                      return;
                    }

                    bool isLogin = await authProvider.logIn(
                      emailController.text,
                      passwordController.text,
                      context,
                    );

                    if (isLogin) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Login Successfully")),
                      );
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        RoutesName.signUp,
                        (route) => false,
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AllColors.teal600,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 16, color: AllColors.white),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Signup Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: TextStyle(fontSize: 16),
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigate to Signup
                      Navigator.pushNamed(context, RoutesName.signUp);
                    },
                    child: const Text(
                      "Register",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
