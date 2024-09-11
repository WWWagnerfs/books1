import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/book_controller.dart';
import 'book_detail_page.dart';

class BookListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final BookController bookController = Get.put(BookController());

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: Text('NYT Best Sellers',style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold))),
      body: Obx(() {
        if (bookController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        if (bookController.books.isEmpty) {
          return Center(child: Text('No books found.'));
        }

        return ListView.builder(
          itemCount: bookController.books.length,
          itemBuilder: (context, index) {
            final book = bookController.books[index];
            return ListTile(
              leading: Image.network(book.bookImage),
              title: Text(book.title),
              subtitle: Text(book.author),
              onTap: () {
                Get.to(() => BookDetailPage(book: book));
              },
            );
          },
        );
      }),
    );
  }
}
