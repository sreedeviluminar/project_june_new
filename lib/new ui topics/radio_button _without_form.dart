import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyRadioButtons(),
    );
  }
}

class MyRadioButtons extends StatefulWidget {
  @override
  _MyRadioButtonsState createState() => _MyRadioButtonsState();
}

class _MyRadioButtonsState extends State<MyRadioButtons> {
  String selectedRadio = '';
  bool isButtonDisabled = true;

  void _handleRadioValueChanged(String value) {
    setState(() {
      selectedRadio = value;
      isButtonDisabled = false; // Enable the button when a radio button is selected
    });
  }

  void _validateAndShowSnackBar() {
    if (selectedRadio.isNotEmpty) {
      // Do something with the selected radio value
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Selected color: $selectedRadio'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Radio Button Validation Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Select a color:'),
            Row(
              children: [
                Radio(
                  value: 'Red',
                  groupValue: selectedRadio,
                  onChanged: (value) => _handleRadioValueChanged(value.toString()),
                ),
                Text('Red'),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: 'Blue',
                  groupValue: selectedRadio,
                  onChanged: (value) => _handleRadioValueChanged(value.toString()),
                ),
                Text('Blue'),
              ],
            ),
            Row(
              children: [
                Radio(
                  value: 'Green',
                  groupValue: selectedRadio,
                  onChanged: (value) => _handleRadioValueChanged(value.toString()),
                ),
                Text('Green'),
              ],
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: isButtonDisabled ? null : _validateAndShowSnackBar,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}