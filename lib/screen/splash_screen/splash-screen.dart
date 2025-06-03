import 'dart:async';

import 'package:event_booking/routes/routes_name.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      user == null
          ? Navigator.pushNamedAndRemoveUntil(
            context,
            RoutesName.login,
            (_) => false,
          )
          : Navigator.pushNamedAndRemoveUntil(
            context,
            RoutesName.home,
            (_) => false,
          );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A9E8E), // Primary theme color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App Logo or Icon
            Icon(Icons.event_available, size: 100, color: Colors.white),
            const SizedBox(height: 30),

            // App Title
            const Text(
              'EventVerse',
              style: TextStyle(
                color: Colors.white,
                fontSize: 36,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
              ),
            ),

            const SizedBox(height: 10),

            // Tagline
            const Text(
              'Your Gateway to Effortless Event Booking',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 60),

            // Optional loading animation
            // const CircularProgressIndicator(
            //   color: Colors.white,
            //   strokeWidth: 2,
            // ),
          ],
        ),
      ),
    );
  }
}
