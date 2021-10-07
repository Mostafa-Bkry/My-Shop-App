import 'package:flutter/material.dart';
import 'package:flutter_shop/components/my_bottom_bar.dart';
import 'package:flutter_shop/components/product_tile.dart';
import 'package:flutter_shop/providers/cart.dart';
import 'package:flutter_shop/providers/products.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cart = context.watch<CartState>();
    var products = context.watch<ProductsState>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Cart',
          style: TextStyle(
              letterSpacing: 5,
              shadows: [
                Shadow(color: Colors.white, blurRadius: 15),
              ],
              fontSize: 27),
        ),
        backgroundColor: Colors.red[800],
        actions: [
          IconButton(
            onPressed: cart.count > 0 ? cart.clear : null,
            icon: const Icon(Icons.delete),
          )
        ],
        leading: IconButton(
            onPressed: () => Navigator.of(context).pushNamed('/'),
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: cart.count > 0
          ? products.products != null
              ? ListView(
                  children: cart.entries.values
                      .map((entry) => ProductTile(
                          product: products.products!
                              .firstWhere((product) => product.id == entry.id)))
                      .toList(),
                )
              : const Center(child: CircularProgressIndicator())
          : Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Cart is empty',
                    style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 5,
                      shadows: [
                        Shadow(color: Colors.black, blurRadius: 15),
                      ],
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                      child: const Text('Add Products'),
                      onPressed: () => Navigator.of(context).maybePop()),
                ],
              ),
            ),
      bottomNavigationBar: const MyBottomBar(),
    );
  }
}
