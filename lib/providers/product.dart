import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  //todo 1 (next product_grid)
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite; // status field dinamis

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.isFavorite = false,
  });

  //todo 4 (next product_item)
  void toggleFavoriteStatus() {
    isFavorite =! isFavorite;
    notifyListeners();
  }
}
