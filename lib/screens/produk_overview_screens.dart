import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widget/product_grid.dart';
import '../widget/badge.dart';
import '../providers/cart_providers.dart';
import '../screens/cart_screen.dart';
import '../widget/app_drawer.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductOverviewScreens extends StatefulWidget {
  @override
  State<ProductOverviewScreens> createState() => _ProductOverviewScreensState();
}

class _ProductOverviewScreensState extends State<ProductOverviewScreens> {

  var _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorites) {
                  _showOnlyFavorites = true;
                } else {
                  _showOnlyFavorites = false;
                }
              });
            },
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Favorites'),
                value: FilterOptions.Favorites,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: FilterOptions.All,
              ),
            ],
            icon: Icon(Icons.more_vert),
          ),

          Consumer<CartProvider>(
            builder: (_, cart, ch) => Badge(
              child: ch!,
              value: cart.itemCount.toString(),
            ),
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
        ],
      ),
      body: ProductsGrid(_showOnlyFavorites),
      drawer: AppDrawer(), // todo 2 (next orders_screen)
    );
  }
}
