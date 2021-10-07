import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_shop/types/product.dart';
import 'package:http/http.dart' as http;

class ProductsState extends ChangeNotifier {
  List<Product>? products;

  ProductsState() {
    refresh();
  }

  Future<void> refresh() async {
    var response =
        await http.get(Uri.parse('https://fakestoreapi.com/products'));

    var json = jsonDecode(response.body);

    products = (json as List<dynamic>)
        .map((value) => Product.fromJson(value))
        .toList();

    notifyListeners();
  }
}
