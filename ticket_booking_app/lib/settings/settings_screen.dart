import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../booking/booking_screen.dart';
import 'settings_controller.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});
  TextEditingController lmtCnrt = TextEditingController();
  TextEditingController prcCnrt = TextEditingController();
  SettingsController settingsController = Get.put(SettingsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
        ),
        body: Column(
          children: [
            TextField(
              controller: lmtCnrt,
              decoration: InputDecoration(labelText: 'Limit'),
            ),
            TextField(
              controller: prcCnrt,
              decoration: InputDecoration(labelText: 'Amount'),
            ),
            ElevatedButton(
                onPressed: () {
                  if (lmtCnrt.text.isNotEmpty && prcCnrt.text.isNotEmpty) {
                    settingsController.setValues(
                        int.parse(lmtCnrt.text), int.parse(prcCnrt.text));
                    Get.to(BookingScreen());
                  }
                },
                child: Text('Save')),
          ],
        ));
  }
}
