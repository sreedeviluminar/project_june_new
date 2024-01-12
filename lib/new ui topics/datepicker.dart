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
          title: const Text('Date Picker Example'),
        ),
        body: DateSelectionDemo(),
      ),
    );
  }
}

class DateSelectionDemo extends StatefulWidget {
  @override
  _DateSelectionDemoState createState() => _DateSelectionDemoState();
}

class _DateSelectionDemoState extends State<DateSelectionDemo> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            readOnly: true,
            controller: TextEditingController(
              text: "${selectedDate.toLocal()}".split(' ')[0],
            ),
            onTap: () => _selectDate(context),
            decoration: const InputDecoration(
              labelText: 'Select Date',
              suffixIcon: Icon(Icons.calendar_today),
            ),
          ),
        ],
      ),
    );
  }
}
/*
* selectedDate.toLocal(): This converts the selectedDate to the local time zone. toLocal() is used to convert the DateTime object from UTC to the local time zone.

.split(' '): This splits the string into a list of substrings using the space character (' ') as the delimiter. For example, if the string is '2022-01-11 12:34:56.789', the result would be ['2022-01-11', '12:34:56.789'].

[0]: This retrieves the first element (index 0) from the list obtained after splitting. In the example, it would be '2022-01-11'.

So, the expression effectively extracts the date part from the formatted string of the local date and time.

If you have a specific format in mind for displaying the date, you might want to use the intl package for more advanced formatting.
*
* */