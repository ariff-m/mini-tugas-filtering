import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mini_tugas_filtering/product_model.dart';


class HomeViewModel extends ChangeNotifier {
  List<ProductsModel> _products = [];
  List<ProductsModel> get products => _products;

  HomeViewModel() {
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    final String response = await rootBundle.loadString('assets/products.json');
    final List<dynamic> data = json.decode(response);
    _products = data.map((json) => ProductsModel.fromJson(json)).toList();
    notifyListeners();   
  }
}
