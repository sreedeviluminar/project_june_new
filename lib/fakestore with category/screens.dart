// main.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_june1/fakestore%20with%20category/service.dart';
// main.dart
void main() {
  runApp(GetMaterialApp(
    initialRoute: '/',
    getPages: [
      GetPage(name: '/', page: () => CategoryScreen()),
      GetPage(name: '/categoryDetails', page: () => CategoryDetailsScreen()),
    ],
  ));
}


// category_screen.dart
class CategoryScreen extends StatelessWidget {
  final FakestoreService fakestoreService = FakestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Categories'),
      ),
      body: FutureBuilder<List<String>>(
        future: fakestoreService.getMainCategories(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<String> mainCategories = snapshot.data!;
            return ListView.builder(
              itemCount: mainCategories.length,
              itemBuilder: (context, index) {
                String category = mainCategories[index];
                return ListTile(
                  title: Text(category),
                  onTap: () {
                    Get.toNamed('/categoryDetails', arguments: category);
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}

// category_details_screen.dart
class CategoryDetailsScreen extends StatelessWidget {
  final FakestoreService fakestoreService = FakestoreService();

  @override
  Widget build(BuildContext context) {
    final String selectedCategory = Get.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text('$selectedCategory Details'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: fakestoreService.getProductsByCategory(selectedCategory),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<Map<String, dynamic>> products = snapshot.data!;
            return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> product = products[index];
                return ListTile(
                  title: Text(product['title']),
                  subtitle: Text(product['description']),
                  // Add more details as needed
                );
              },
            );
          }
        },
      ),
    );
  }
}
