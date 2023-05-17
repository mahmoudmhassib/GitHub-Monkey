import 'dart:convert';

import 'models.dart';
import 'package:http/http.dart' as http;
Future<Product> fetchDataById(int id)async{
  final URl='https://food-monkey-api.onrender.com/products/menuItem/$id';
  final response=await http.get(Uri.parse(URl));
  if(response.statusCode==200){
    Map<String,dynamic> jsondecode=json.decode(response.body);
    return Product.fromJson(jsondecode);
  }else{
    throw Exception('cant loading data by id');
  }
}