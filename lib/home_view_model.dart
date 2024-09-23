import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mini_tugas_filtering/product_model.dart';

class HomeViewModel extends ChangeNotifier {
  List<ProductsModel> _products = [];
  List<ProductsModel> _filteredProducts = [];

  double minPrice = 0;
  double maxPrice = double.infinity;
  double minStock = 0;
  double maxStock = double.infinity;
  String? selectedCategory;

  List<ProductsModel> get filteredProducts => _filteredProducts;

  HomeViewModel() {
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    final String response = await rootBundle.loadString('assets/products.json');
    final List<dynamic> data = json.decode(response);
    _products = data.map((json) => ProductsModel.fromJson(json)).toList();
    _filteredProducts = List.from(_products);
    notifyListeners();
  }

  void setMinPrice(double value) {
    minPrice = value;
  }

  void setMaxPrice(double value) {
    maxPrice = value;
  }

  void setMinStock(double value) {
    minStock = value;
  }

  void setMaxStock(double value) {
    maxStock = value;
  }

  void applyFilters() {
    _filteredProducts = _products.where((product) {
      final isPriceInRange =
          product.price >= minPrice && product.price <= maxPrice;
      final isStockInRange =
          product.stock >= minStock && product.stock <= maxStock;
      final isCategoryMatched = selectedCategory == null ||
          product.category == categoryValues.map[selectedCategory];
      return isPriceInRange && isStockInRange && isCategoryMatched;
    }).toList();

    notifyListeners();

    resetFilters();
  }

  void filterByCategory(String category) {
    selectedCategory = category;
  }

  void resetFilters() {
    minPrice = 0;
    maxPrice = double.infinity;
    minStock = 0;
    maxStock = double.infinity;
    selectedCategory = null;
    notifyListeners();
  }
}
