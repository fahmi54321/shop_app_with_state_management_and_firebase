import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/order_providers.dart';
import '../widget/order_item_widget.dart';
import '../widget/app_drawer.dart';

class OrderScreen extends StatefulWidget {
  static const routeName = '/orders';

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  var _isLoading = false; //todo 2

  //todo 3
  @override
  void initState() {
    Future.delayed(Duration.zero).then((_) async {
      setState(() {
        _isLoading = true;
      });

      await Provider.of<OrderProvider>(context,listen: false).fetchAndSetOrders();

      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<OrderProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      body: _isLoading == true //todo 4 (finish)
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemBuilder: (ctx, i) => OrderItemWidget(
                orderData.orders[i],
              ),
              itemCount: orderData.orders.length,
            ),
      drawer: AppDrawer(),
    );
  }
}
