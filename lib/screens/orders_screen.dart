import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/order_providers.dart';
import '../widget/order_item_widget.dart';
import '../widget/app_drawer.dart';

class OrderScreen extends StatelessWidget {
  static const routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<OrderProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, i) => OrderItemWidget(
          orderData.orders[i],
        ),
        itemCount: orderData.orders.length,
      ),
      drawer: AppDrawer(), //todo 3 (finish)
    );
  }
}
