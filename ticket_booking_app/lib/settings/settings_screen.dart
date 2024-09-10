import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../booking/booking_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
        ),
        body: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Limit'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
            ),
            ElevatedButton(
                onPressed: () {
                  Get.to(BookingScreen());
                },
                child: Text('Save')),
          ],
        ));
  }
}
