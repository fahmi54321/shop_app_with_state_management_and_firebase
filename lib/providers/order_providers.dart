import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './cart_providers.dart';

//todo 1 (next cart_providers)
class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  OrderItem({
    required this.id,
    required this.amount,
    required this.products,
    required this.dateTime,
  });
}

class OrderProvider with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  //todo 1 (next cart_screen)
  Future<void> addOrder(List<CartItem> cartProducts, double total) async {
    final url =
        'https://firstflutter-e43f3-default-rtdb.firebaseio.com/orders.json';
    final response = await http.post(Uri.parse(url),
        body: json.encode({
          'amount': total,
          'dateTime': DateTime.now().toIso8601String(),
          'products': cartProducts
              .map((element) => {
                    'id': element.id,
                    'title': element.title,
                    'quantity': element.quantity,
                    'price': element.price,
                  })
              .toList()
        }));

    _orders.insert(
      0,
      OrderItem(
        id: jsonDecode(response.body)['name'],
        amount: total,
        products: cartProducts,
        dateTime: DateTime.now(),
      ),
    );

    notifyListeners();
  }
}
