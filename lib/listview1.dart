import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: ListView1(),
  ));
}

class ListView1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
      ),
      body: ListView(
        children:  [
          Card(
            child: ListTile(
              title: Text("HamBurger"),
              subtitle: Text("\$190"),
              trailing: Icon(Icons.shopping_cart),
              leading: Image.asset("assets/images/hamburger.png") ,
            ),
          ),
          Card(
            child: ListTile(
              title: Text("Pizza"),
              subtitle: Text("\$290"),
              trailing: Icon(Icons.shopping_cart),
              leading: Image.asset("assets/images/pizza.png") ,
            ),
          ),
          Card(
            child: ListTile(
              title: Text("Pizza"),
              subtitle: Text("\$290"),
              trailing: Icon(Icons.shopping_cart),
              leading: Image.asset("assets/images/pizza.png") ,
            ),
          ),
        ],
      ),
    );
  }
}
