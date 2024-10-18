import 'package:book_reader/models/book.model.dart';
import 'package:book_reader/network/network.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Network network = Network();

  List<Book> _books = [];

  Future<List<Book>> _searchBooks(String query) async {
    try {
      List<Book> books = await network.searchBooks(query);
      setState(() {
        _books = books;
      });
      return books;
    } catch (e) {
      rethrow;
    }
  }

  @override
  void initState() {
    _searchBooks("flutter");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Text("Home");
  }
}
