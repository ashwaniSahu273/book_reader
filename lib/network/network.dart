import 'dart:convert';

import 'package:book_reader/models/book.model.dart';
import 'package:http/http.dart' as http;

class Network {

  static const String _baseUrl = "https://www.googleapis.com/books/v1/volumes";

  Future <List<Book>> searchBooks(String query) async {
        try{
           var url = Uri.parse("$_baseUrl?q=$query");
           final response = await http.get(url);
           if(response.statusCode == 200){
            final jsonData = json.decode(response.body);
            final books = jsonData['items'].map((book) => Book.fromJson(book)).toList();
            return books;
           }
           else{
            return ["Failed to load"];
           }
        }
        catch (e){
         print("This is fetching error : $e");
        }
  }

}