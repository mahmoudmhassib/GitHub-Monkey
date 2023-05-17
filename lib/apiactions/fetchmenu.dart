import 'dart:convert';

import 'models.dart';
import 'package:http/http.dart' as http;

Future<List<Product>> fetchData(String menuType) async {
  final URL = 'https://food-monkey-api.onrender.com/products/menu/$menuType';
  final response = await http.get(Uri.parse(URL));
  print(response.body);
  if (response.statusCode == 200) {

    List jsondecode = json.decode(response.body);
    return jsondecode.map((data) => Product.fromJson(data)).toList();
  } else {
    throw Exception('there is error in load fetch data');
  }
}
