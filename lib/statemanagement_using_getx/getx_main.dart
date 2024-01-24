import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_june1/statemanagement_using_getx/controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Initialize the GetX controllers
    final CounterController counterController = Get.put(CounterController());

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('GetX Counter App'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(
                    () => Text(
                  'Count: ${counterController.count}',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => counterController.increment(),
                child: Text('Increment'),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () => counterController.decrement(),
                child: Text('Decrement'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
