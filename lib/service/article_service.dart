import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/article_model.dart';

class ApiService {
  static const String baseUrl = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<Article>> fetchArticles({int start = 0, int limit = 10}) async {
    final response = await http.get(Uri.parse('$baseUrl?_start=$start&_limit=$limit'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      print('API Response: $data');
      return data.map((json) => Article.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load articles');
    }
  }
}
