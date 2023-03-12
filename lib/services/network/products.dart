import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:technical_exam/models/product/details.dart';
import 'package:technical_exam/models/product/item.dart';
import 'package:technical_exam/services/functions/dialogs.dart';
import 'package:technical_exam/values/endpoints.dart';

class ProductsServices extends ChangeNotifier {

  final DialogsServices dialogs = DialogsServices();

  // Determines whether a loading progress HUD will display
  bool isLoading = false;

  // Future value to be used b List View builder
  Future<List<ProductItem>>? listFuture;

  // Set limit of items to be displayed on one page
  final limit = 10;

  // Set total number of items
  int? totalItems;

  // Pagination value
  int pagination = 90;

  // Populates values for List View builder
  void updateListFuture() {
    listFuture = getProducts();
    notifyListeners();
  }

  // Triggers loading progress HUD to display or disappear
  void showSpinner(bool value) {
    isLoading = value;
    notifyListeners();
  }

  // Change page (Next)
  void nextPagination() {
    if ((pagination + limit) != totalItems! && (pagination + limit) < totalItems!) {
      pagination += limit;
      notifyListeners();

      updateListFuture();
    } else {
      // Don't exceed total items
    }

  }

  // Change page (Previous)
  void previousPagination() {
    if (pagination != 0) {
      pagination -= limit;
      notifyListeners();

      updateListFuture();
    } else {
      // Disabled if first page
    }
  }

  double getDiscountedAmount({
    required double price,
    required double discountPercentage,
  }) {
    final double discountAmount = (price * discountPercentage) / 100;
    final double discountedPrice = price - discountAmount;

    return discountedPrice;
  }

  // API call to get list of products
  Future<List<ProductItem>> getProducts() async {

    // Set URI
    final Uri uri = Uri.https(EndPoints.authority, EndPoints.products, {
      // Set parameters
      "limit": limit.toString(),
      "skip": pagination.toString(),
      "select": "title,price,thumbnail,stock,discountPercentage",
    });

    try {
      print("Calling $uri");
      return await http.get(uri,
        headers: EndPoints.headers,
      ).then((http.Response response) {
        // If successful
        if (response.body.isNotEmpty && response.statusCode == 200) {

          totalItems = jsonDecode(response.body)["total"] as int;
          notifyListeners();

          return (jsonDecode(response.body)["products"] as List).map((json) {
            return ProductItem.fromJson(json);
          }).toList();

          // If error occurs
        } else {
          throw "An unexpected error occurred";
        }
      });
    } on SocketException {
      showSpinner(false);
      throw "No internet access";
    }
  }

  // API call to get product details
  Future<ProductDetails> getDetails(BuildContext context, {
    required int productId,
  }) async {

    showSpinner(true);

    // Set URI
    final Uri uri = Uri.https(EndPoints.authority, "${EndPoints.products}/$productId");

    try {
      print("Calling $uri");
      return await http.get(uri,
        headers: EndPoints.headers,
      ).then((http.Response response) {
        if (response.body.isNotEmpty) {
          showSpinner(false);
          if (response.statusCode == 200) {
            print(response.body);
            return ProductDetails.fromJson(jsonDecode(response.body));
          } else {
            throw "An unexpected error occurred";
          }
        } else {
          throw "Response body was empty";
        }
      });
    } on SocketException {
      const String message = "No internet access";
      showSpinner(false);
      dialogs.showErrorMessage(context, message: message);
      throw message;
    }

  }

}