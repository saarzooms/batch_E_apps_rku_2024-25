import 'package:flutter/material.dart';

class BookingList extends StatelessWidget {
  const BookingList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text('Earning'),
          Text('Available seats'),
          Expanded(
            child: ListView.builder(
                itemBuilder: (context, index) => Card(
                      child: Column(
                        children: [
                          Text('Name'),
                          Row(
                            children: [
                              Text('Count'),
                              Text('Amount'),
                            ],
                          )
                        ],
                      ),
                    )),
          )
        ],
      ),
    );
  }
}
