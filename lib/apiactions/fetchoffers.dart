import 'dart:convert';

import 'models.dart';
import 'package:http/http.dart' as http;
Future<List<Product>> fetchOffers() async {
  const url='https://food-monkey-api.onrender.com/products/offers';
  final response=await http.get(Uri.parse(url));
  if(response.statusCode==200){
  print(response.body);

    List parsed=json.decode(response.body);
    return parsed.map((data) => Product.fromJson(data)).toList();
  }else{
    throw Exception('there is error in load fetch data');
  }
}
