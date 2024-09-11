import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/book.dart';

class BookDetailPage extends StatelessWidget {
  final Book book;

  BookDetailPage({required this.book});

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    try {
      await launchUrl(uri);
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          book.title,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(book.bookImage),
            SizedBox(height: 10),

            Text(
              book.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),

            Text(
              'by ${book.author}',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: 16),

            Text(book.description),
            SizedBox(height: 16),

            ElevatedButton(
              onPressed: () {
                print(book.amazonProductUrl);
                _launchURL(book.amazonProductUrl);
              },
              child: Text('Buy on Amazon'),
            ),
          ],
        ),
      ),
    );
  }
}
