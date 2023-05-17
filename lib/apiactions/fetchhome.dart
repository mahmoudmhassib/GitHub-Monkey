import 'dart:convert';

import 'package:http/http.dart' as http;

import 'modelshome.dart';
Future<List<Items>> fetchHome()async{
  final URL='https://food-monkey-api.onrender.com/products/food-types';
  final response=await http.get(Uri.parse(URL));
  if(response.statusCode==200){
    List jsondecode=json.decode(response.body);
    return jsondecode.map((data){
      return Items.fromJson(data);
    }).toList();
  }else{
    throw Exception('there is error in load fetch data');
  }
}
