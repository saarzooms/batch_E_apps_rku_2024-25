import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../settings/settings_controller.dart';
import 'booking_controller.dart';
import 'booking_list.dart';

class BookingScreen extends StatelessWidget {
  BookingScreen({super.key});
  BookingController _bookingController = Get.put(BookingController());
  SettingsController _settingsController = Get.find<SettingsController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Obx(() {
      return Column(children: [
        Text(
            'Available:${_settingsController.limit.value - _bookingController.bookedCount.value}'),
        TextField(
          decoration: InputDecoration(
            labelText: 'Name',
          ),
        ),
        TextField(
          decoration: InputDecoration(
            labelText: 'Seat Count',
          ),
        ),
        Text('Total to Pay'),
        ElevatedButton(
            onPressed: () {
              Get.to(() => BookingList());
            },
            child: Text('Book'))
      ]);
    }));
  }
}
