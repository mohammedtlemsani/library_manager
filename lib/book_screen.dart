import 'package:flutter/material.dart';
import 'add_book_screen.dart';
import 'book_detail_screen.dart';

class BooksScreen extends StatefulWidget {
  @override
  _BooksScreenState createState() => _BooksScreenState();
}

class _BooksScreenState extends State<BooksScreen> {
  final List<Book> books = [
    Book(
      title: 'Java Oriented Object Programming',
      author: 'Mohammed Tlemsani',
      imageUrl: 'assets/book1_cover.jpeg',
      description: 'a book to study oriented object programming with java',
    ),
    Book(
      title: 'ici c est paris',
      author: 'taha semlali',
      imageUrl: 'assets/book1_cover.jpeg',
      description: 'un livre qui decrit paris parfaitement',
    ),
    Book(
      title: 'il etait une fois',
      author: 'hamid',
      imageUrl: 'assets/book1_cover.jpeg',
      description: 'un livre qui decrit raconte quelque chose qui a passee il ya longtemps ',
    ),

  ];
  void _addBook(Map<String, String> bookData) {
    setState(() {
      books.add(Book(
        title: bookData['title']!,
        author: bookData['author']!,
        imageUrl: bookData['imageUrl']!,
        description: bookData['description']!,
      ));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Livres'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddBookScreen(),
                ),
              );
              if (result != null) {
                _addBook(result);
              }
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return ListTile(
            leading: Image.asset(book.imageUrl, width: 50, height: 50, fit: BoxFit.cover),
            title: Text(book.title),
            subtitle: Text(book.author),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BookDetailScreen(book: book),
                ),
              );
            },
          );
        },
      ),
    );
  }
}


class Book {
  final String title;
  final String author;
  final String imageUrl;
  final String description;

  Book({
    required this.title,
    required this.author,
    required this.imageUrl,
    required this.description,
  });
}