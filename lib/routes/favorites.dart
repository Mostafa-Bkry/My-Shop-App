import 'package:flutter/material.dart';
import 'package:flutter_shop/components/my_bottom_bar.dart';
import 'package:flutter_shop/components/product_tile.dart';
import 'package:flutter_shop/providers/favorites.dart';
import 'package:flutter_shop/providers/products.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var products = context.watch<ProductsState>();
    var favorites = context.watch<FavoritesState>();

    if (products.products == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Favorites',
          style: TextStyle(
              letterSpacing: 5,
              shadows: [
                Shadow(color: Colors.white, blurRadius: 15),
              ],
              fontSize: 27),
        ),
        backgroundColor: Colors.red[800],
        leading: IconButton(
            onPressed: () => Navigator.of(context).pushNamed('/'),
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      body: ReorderableListView(
          onReorder: favorites.reorder,
          children: favorites.ids.map((id) {
            var product =
                products.products!.firstWhere((element) => element.id == id);

            return ProductTile(
                key: Key(product.id.toString()), product: product);
          }).toList()),
      bottomNavigationBar: const MyBottomBar(),
    );
  }
}
