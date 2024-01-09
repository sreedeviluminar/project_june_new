/// ConstrainedBox is a built-in widget of
/// Flutter that lets you specify the maximum or minimum width and height of its child widget.
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Constrained Box')),
        body: Center(
          /// 1
          // child: ConstrainedBox(
          //   constraints: const BoxConstraints(maxHeight: 200, maxWidth: 200),
          //   child: Container(
          //     color: Colors.orange,
          //   ),
          // ),
          /// 2
          // child:  ConstrainedBox(
          //   constraints: const BoxConstraints.tightFor(width: 150, height: 150),
          //   child: ElevatedButton(
          //     child: const Text('I am a button'),
          //     onPressed: () {},
          //   ),
          // ),
          child: Column(children: [
            ConstrainedBox(
              constraints: const BoxConstraints(
                  minWidth: 200, minHeight: 200, maxWidth: 350, maxHeight: 350),
              child: Image.network(
                'https://plus.unsplash.com/premium_photo-1703775439859-02ac42d6e322?q=80&w=1888&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                fit: BoxFit.fill,
                // the original resolution is 640 x 426
              ),
            ),

            // just add some white space
            const SizedBox(
              height: 20,
            ),

            ConstrainedBox(
              constraints: const BoxConstraints(
                  minWidth: 200, minHeight: 200, maxWidth: 350, maxHeight: 350),
              child: Image.network(
                  'https://images.unsplash.com/photo-1704240801694-6f43640c6ae8?q=80&w=1915&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                  // the original resolution is 101 x 97
                  fit: BoxFit.fill),
            )
          ]),
        ));
  }
}
