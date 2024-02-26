// fakestore_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
class FakestoreService {
  final String baseUrl = "https://fakestoreapi.com";

  Future<List<String>> getMainCategories() async {
    final response = await http.get(Uri.parse("$baseUrl/products/categories"));
    if (response.statusCode == 200) {
      List<dynamic> categoriesJson = json.decode(response.body);
      List<String> mainCategories = categoriesJson.map((categoryJson) => categoryJson.toString()).toList();
      return mainCategories;
    } else {
      throw Exception('Failed to load main categories');
    }
  }

  Future<List<Map<String, dynamic>>> getProductsByCategory(String category) async {
    final response = await http.get(Uri.parse("$baseUrl/products/category/$category"));
    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(json.decode(response.body));
    } else {
      throw Exception('Failed to load products for category $category');
    }
  }
}
