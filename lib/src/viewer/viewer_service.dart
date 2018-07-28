import 'dart:async';
import 'dart:convert';

import 'package:angular/core.dart';
import 'package:http/http.dart';

@Injectable()
class ViewerService {
  final Client _http;
  ViewerService(this._http);

  Future<List<String>> getPages() async {
    try {
      final response = await _http.get("http://localhost:3100/books/3411.json");
      final urls = (_extractData(response) as List).map((value) => value.toString()).toList();
      return urls;
    } catch(e) {
      print(e);
      return [""];
    }
  }
  dynamic _extractData(Response resp) => jsonDecode(resp.body)['data'];
}
