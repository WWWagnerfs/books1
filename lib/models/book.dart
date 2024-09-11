class Book {
  final int rank;
  final int rankLastWeek;
  final int weeksOnList;
  final String primaryIsbn10;
  final String primaryIsbn13;
  final String publisher;
  final String description;
  final String price;
  final String title;
  final String author;
  final String bookImage;
  final String amazonProductUrl;

  Book({
    required this.rank,
    required this.rankLastWeek,
    required this.weeksOnList,
    required this.primaryIsbn10,
    required this.primaryIsbn13,
    required this.publisher,
    required this.description,
    required this.price,
    required this.title,
    required this.author,
    required this.bookImage,
    required this.amazonProductUrl,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      rank: json['rank'],
      rankLastWeek: json['rank_last_week'],
      weeksOnList: json['weeks_on_list'],
      primaryIsbn10: json['primary_isbn10'],
      primaryIsbn13: json['primary_isbn13'],
      publisher: json['publisher'],
      description: json['description'],
      price: json['price'],
      title: json['title'],
      author: json['author'],
      bookImage: json['book_image'],
      amazonProductUrl: json['amazon_product_url'],
    );
  }
}

class BookListResponse {
  final List<Book> books;

  BookListResponse({required this.books});

  factory BookListResponse.fromJson(Map<String, dynamic> json) {
    var list = json['results']['books'] as List;
    List<Book> bookList = list.map((i) => Book.fromJson(i)).toList();

    return BookListResponse(books: bookList);
  }
}
