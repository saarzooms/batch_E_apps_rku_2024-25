import 'package:counter_app/counter/counter_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CounterPage extends StatelessWidget {
  CounterPage({super.key});
  CounterController controller = Get.put(CounterController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          title: Text('Counter App'),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(() {
                return Text(
                  controller.count.toString(),
                  style: TextStyle(
                    fontSize: 40,
                  ),
                );
              }),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {
                        controller.inc();
                      },
                      icon: Icon(Icons.add)),
                  IconButton(
                      onPressed: () {
                        controller.dec();
                      },
                      icon: Icon(Icons.remove)),
                  IconButton(
                      onPressed: () {
                        controller.reset();
                      },
                      icon: Icon(Icons.refresh)),
                ],
              )
            ],
          ),
        ));
  }
}
