import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Simple Animation'),
        ),
        body: MyAnimatedContainer(),
      ),
    );
  }
}

class MyAnimatedContainer extends StatefulWidget {
  @override
  _MyAnimatedContainerState createState() => _MyAnimatedContainerState();
}

class _MyAnimatedContainerState extends State<MyAnimatedContainer> {
  double _position = 0.0; // Initial position

  void _animateContainer() {
    setState(() {
      _position = _position == 0.0 ? 200.0 : 0.0; // Toggle position
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: _animateContainer,
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          width: 100.0,
          height: 100.0,
          color: Colors.blue,
          margin: EdgeInsets.only(left: _position),
          // Use position to move left
          child: Center(
            child: Text(
              'Tap to Animate',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
/*
*
* AnimatedContainer widget that moves horizontally across the screen when tapped.The
* _position variable toggles between 0.0 and 200.0 in this case, which moves the container
* horizontally using the margin property.Remember, Flutter provides various ways
* to animate widgets, including using AnimationController, Tween,
* and AnimatedBuilder for more complex animations.
* */
