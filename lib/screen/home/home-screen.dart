// ignore_for_file: file_names, use_build_context_synchronously

import 'package:event_booking/provider/auth_provider/auth-provider.dart';
import 'package:event_booking/routes/routes_name.dart';
import 'package:event_booking/services/api-services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> dummyEvents = [
      {
        'title': 'Flutter Workshop',
        'date': 'June 10, 2025',
        'location': 'Online',
      },
      {'title': 'Startup Meetup', 'date': 'June 15, 2025', 'location': 'Delhi'},
      {'title': 'Music Fest', 'date': 'June 20, 2025', 'location': 'Mumbai'},
    ];
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
      body: ListView.builder(
        itemCount: dummyEvents.length,
        itemBuilder: (context, index) {
          final event = dummyEvents[index];
          return Card(
            margin: const EdgeInsets.all(12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: const Icon(Icons.event),
              title: Text(event['title'] ?? ''),
              subtitle: Text('${event['date']} • ${event['location']}'),
              trailing: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1A9E8E),
                ),
                onPressed: () {
                  // book now logic later
                  APIClass().getPostData();
                },
                child: const Text('Book Now'),
              ),
            ),
          );
        },
      ),
    );
  }
}
