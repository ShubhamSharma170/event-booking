// ignore_for_file: file_names, use_build_context_synchronously

import 'package:event_booking/provider/auth_provider/auth-provider.dart';
import 'package:event_booking/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        actions: [
          IconButton(
            onPressed: () async {
              await authProvider.logOut(context);
              Navigator.pushNamedAndRemoveUntil(
                context,
                RoutesName.login,
                (_) => false,
              );
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(child: Text('Home Screen')),
    );
  }
}
