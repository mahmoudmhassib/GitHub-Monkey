
import 'package:flutter/material.dart';
import 'package:monekyapp/apiactions/fetchmenu.dart';

import 'package:monekyapp/apiactions/models.dart';
import 'package:monekyapp/apiactions/modelshome.dart';

import '../apiactions/fetchhome.dart';
import '../apiactions/fetchoffers.dart';

//TODO:store
class ProviderProduct extends ChangeNotifier {
  //TODO: Initialize list
  List<Product> _products = [];
  List<Items> _foodTypes = [];
  List<Product> _offers = [];

  //TODO: getter method
  List<Product> get products => _products;
  List<Items> get foodTypes => _foodTypes;
  List<Product> get offers => _offers;

  //TODO: setter methods
  // Setter for menu types
  Future<void> getAllProds() async {
    final res = await fetchData('food');
    _products=res;
  }

  //Todo get food types
  Future<void> getFoodTypes() async {
    final res = await fetchHome();
    _foodTypes=res;
  }

  //Todo get offers
  Future<void> getAlloffers() async {
    final res = await fetchOffers();
    _offers=res;

  }

  Product getProdById(int id)=>_products.firstWhere((element) => element.id==id);
}


