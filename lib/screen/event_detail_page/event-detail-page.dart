// ignore_for_file: file_names
import 'package:event_booking/constant/colors.dart';
import 'package:flutter/material.dart';

class EventDetailScreen extends StatelessWidget {
  final dynamic eventDetails;
  const EventDetailScreen({required this.eventDetails, super.key});

  @override
  Widget build(BuildContext context) {
    // log("event title ${eventDetails.title}");
    return Scaffold(
      backgroundColor: const Color(0xFFF7F9FB),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Event Details",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Event image placeholder
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                "assets/image/event.jpg",
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),

            // Event Title
            Text(
              eventDetails.title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            // Date & Location
            Row(
              children: const [
                Icon(Icons.calendar_today, size: 18, color: Colors.grey),
                SizedBox(width: 6),
                Text("June 20, 2025"),
                SizedBox(width: 16),
                Icon(Icons.location_on, size: 18, color: Colors.grey),
                SizedBox(width: 6),
                Text("New Delhi"),
              ],
            ),
            const SizedBox(height: 20),

            // Description
            const Text(
              "About this event",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text(
              // "Join us for an unforgettable evening of music, food, and fun! "
              // "Enjoy live performances by top artists and immerse yourself in a vibrant atmosphere.",
              eventDetails.body,
              style: TextStyle(fontSize: 15, color: Colors.black87),
            ),

            const SizedBox(height: 30),

            // Book Now Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.event_available, color: AllColors.black),
                label: Text(
                  "Book Now",
                  style: TextStyle(fontSize: 16, color: AllColors.black),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1A9E8E),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
