import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final FlutterSecureStorage _storage = FlutterSecureStorage();
  String _storedValue = '';

  void _saveValue() async {
    await _storage.write(key: 'myKey', value: 'Hello Flutter Secure Storage!');
    setState(() {
      _storedValue = 'Value saved!';
    });
  }

  void _readValue() async {
    String value = await _storage.read(key: 'myKey') ?? 'Key not found!';
    setState(() {
      _storedValue = value;
    });
  }

  void _updateValue() async {
    await _storage.write(key: 'myKey', value: 'Updated value!');
    setState(() {
      _storedValue = 'Value updated!';
    });
  }

  void _deleteValue() async {
    await _storage.delete(key: 'myKey');
    setState(() {
      _storedValue = 'Value deleted!';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Secure Storage CRUD'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Stored Value:',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              _storedValue,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveValue,
              child: Text('Save Value'),
            ),
            ElevatedButton(
              onPressed: _readValue,
              child: Text('Read Value'),
            ),
            ElevatedButton(
              onPressed: _updateValue,
              child: Text('Update Value'),
            ),
            ElevatedButton(
              onPressed: _deleteValue,
              child: Text('Delete Value'),
            ),
          ],
        ),
      ),
    );
  }
}
