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
          title: Text('Search and Set Text Example'),
        ),
        body: SearchSetTextDemo(),
      ),
    );
  }
}

class SearchSetTextDemo extends StatefulWidget {
  @override
  _SearchSetTextDemoState createState() => _SearchSetTextDemoState();
}

class _SearchSetTextDemoState extends State<SearchSetTextDemo> {
  List<String> allItems = [
    'Apple',
    'Banana',
    'Cherry',
    'Date',
    'Fig',
    'Grapes',
    'Kiwi',
    'Lemon',
    'Mango',
    'Orange',
    'Peach',
    'Pear',
    'Plum',
    'Raspberry',
    'Strawberry',
  ];

  String searchText = '';
  String searchResult = '';

  void filterItems(String query) {
    setState(() {
      searchText = query;
      searchResult = ''; // Reset the search result when typing in the search field
    });
  }

  void setSearchResult(String result) {
    setState(() {
      searchResult = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> filteredItems = allItems
        .where((item) => item.toLowerCase().contains(searchText.toLowerCase()))
        .toList();

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            onChanged: (value) {
              filterItems(value);
            },
            decoration: InputDecoration(
              labelText: 'Search',
              hintText: 'Enter a fruit name',
              prefixIcon: Icon(Icons.search),
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(filteredItems[index]),
                  onTap: () {
                    setSearchResult(filteredItems[index]);
                  },
                );
              },
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Search Result: $searchResult',
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
