import 'package:dio/dio.dart';
import '../models/book.dart';
import '../config.dart';

class ApiService {
  final Dio _dio = Dio();
  final String apiKey = Config.apiKey;

  Future<List<Book>> fetchBooks() async {
    final response = await _dio.get(
      'https://api.nytimes.com/svc/books/v3/lists/current/hardcover-fiction.json',
      queryParameters: {'api-key': apiKey},
    );

    if (response.statusCode == 200) {
      List<dynamic> booksJson = response.data['results']['books'];
      return booksJson.map((json) => Book.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load books');
    }
  }
}
