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
          title: Text('Radio Button Validation'),
        ),
        body: MyForm(),
      ),
    );
  }
}

class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  // Create a GlobalKey for the Form
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Variable to store the selected radio value
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            // Radio button options
            ListTile(
              title: Text('Option 1'),
              leading: Radio(
                value: 'Option 1',
                groupValue: _selectedValue,
                onChanged: (value) {
                  setState(() {
                    _selectedValue = value.toString();
                  });
                },
              ),
            ),
            ListTile(
              title: Text('Option 2'),
              leading: Radio(
                value: 'Option 2',
                groupValue: _selectedValue,
                onChanged: (value) {
                  setState(() {
                    _selectedValue = value.toString();
                  });
                },
              ),
            ),
            // Submit button
            ElevatedButton(
              onPressed: () {
                // Validate the form
                if (_formKey.currentState!.validate()) {
                  // Form is valid, process the data
                  print('Selected value: $_selectedValue');
                }
              },
              child: Text('Submit'),
            ),
            Text('selected value is $_selectedValue')
          ],
        ),
      ),
    );
  }
}
