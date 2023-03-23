import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../models/products_model.dart';

class ProductProvider with ChangeNotifier {
  List<String> sizeChart = ["S", "M", "L", "XL", "XXL"];
  late Products products;
  Map<String, dynamic> map = {};
  bool error = false;
  String errorMessage = "";
  Future<void> get fetchData async {
    final response = await get(Uri.parse(
        "https://dl.dropbox.com/s/jkbdzw80uql3lxj/products.json?dl=0"));
    if (response.statusCode == 200) {
      try {
        map = jsonDecode(response.body);
        error = false;
        products = Products.fromJson(map);
      } catch (e) {
        error = true;
        errorMessage = e.toString();
      }
    } else {
      error = true;
      map = {};
      errorMessage = "Oops! Error Occured";
    }

    notifyListeners();
  }

  mockFetch() async {}
}
