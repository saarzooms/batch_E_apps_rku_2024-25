import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'booking_list.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Text('Available'),
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
    ]));
  }
}
