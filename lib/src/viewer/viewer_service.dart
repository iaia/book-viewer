import 'dart:async';
import 'dart:convert';

import 'package:angular/core.dart';
import 'package:http/http.dart';

import 'package:book_viewer/src/book/book.dart';
import 'package:book_viewer/src/book/page.dart';

@Injectable()
class ViewerService {
  final Client _http;
  ViewerService(this._http);

  Future<Book> getBook() async {
    try {
      final response = await _http.get("http://localhost:3100/books/3411.json");
      final page = Page("");
      final book = Book((_extractData(response) as List).map((value) => Page(value.toString())).toList());
      return book;
    } catch(e) {
      print(e);
      return Book([Page("")]);
    }
  }
  dynamic _extractData(Response resp) => jsonDecode(resp.body)['data'];
}
