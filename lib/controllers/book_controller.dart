import 'package:get/get.dart';
import '../models/book.dart';
import '../services/api_service.dart';

class BookController extends GetxController {
  var books = <Book>[].obs;
  var isLoading = true.obs;
  final ApiService apiService = ApiService();

  @override
  void onInit() {
    fetchBooks();
    super.onInit();
  }

  Future<void> fetchBooks() async {
    try {
      isLoading(true);
      var bookList = await apiService.fetchBooks();
      books.value = bookList;
    } finally {
      isLoading(false);
    }
  }
}
