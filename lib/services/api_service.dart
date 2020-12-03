import 'dart:convert';
import 'package:http/http.dart';
import 'package:repasoflutter/models/cases.dart';

class Apiservice {
  final String apiUrl = "http://82.158.231.181:3000/api";

  Future<List<Cases>> getCases() async {
    Response res = await get(apiUrl);
    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Cases> cases =
          body.map((dynamic item) => Cases.fromJson(item)).toList();
      return cases;
    } else {
      throw "Fallo la llamada a la lista";
    }
  }
}
