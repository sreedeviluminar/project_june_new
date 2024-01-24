import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('ConstrainedBox Example'),
        ),
        body: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 200.0,
              maxHeight: 200.0,
            ),
            child: Container(
              color: Colors.blue,
              width: double.infinity, // This will be constrained to maxWidth
              height: 350.0, // This will be constrained to maxHeight
              child: const Center(
                child: Text(
                  'ConstrainedBox Example',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}