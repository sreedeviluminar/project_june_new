import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyDiq7-WCnuL3BMWaydX34c4y3S2dKEN9qc",
        projectId: "famous-smithy-394706",
        appId: '1:228270350036:android:9b5491946414627eb5e541',
        messagingSenderId: '',
        storageBucket: "famous-smithy-394706.appspot.com",
      ));  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
      color: Colors.indigo[900],
    );
  }
}
