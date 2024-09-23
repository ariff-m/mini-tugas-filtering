import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:mini_tugas_filtering/product_model.dart';

class ProductService {
  Future<List<ProductsModel>> fetchProducts() async {
    final String response = await rootBundle.loadString('assets/products.json');
    final List<dynamic> data = json.decode(response);
    return data.map((json) => ProductsModel.fromJson(json)).toList();
  }
}
