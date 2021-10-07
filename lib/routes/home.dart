import 'package:flutter/material.dart';
import 'package:flutter_shop/components/my_bottom_bar.dart';
import 'package:flutter_shop/components/my_drawer.dart';
import 'package:flutter_shop/components/product_card.dart';
import 'package:flutter_shop/components/product_tile.dart';
import 'package:flutter_shop/providers/cart.dart';
import 'package:flutter_shop/providers/products.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cart = context.watch<CartState>();
    var products = context.watch<ProductsState>();

    return DefaultTabController(
      length: 6,
      child: Scaffold(
          drawer: const MyDrawer(),
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.blue[800],
            title: Row(mainAxisSize: MainAxisSize.min, children: [
              Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Icon(
                    Icons.shopping_basket_rounded,
                    color: Colors.cyan[200],
                    size: 30,
                  )),
              const Text(
                'Shoppe',
                style: TextStyle(
                    letterSpacing: 5,
                    shadows: [
                      Shadow(color: Colors.white, blurRadius: 15),
                    ],
                    fontSize: 27),
              ),
            ]),
            actions: [
              IconButton(
                  icon: const Icon(
                    Icons.favorite,
                    color: Colors.yellowAccent,
                  ),
                  onPressed: () =>
                      Navigator.of(context).pushNamed('/favorites')),
              IconButton(
                onPressed: () => Navigator.of(context).pushNamed('/cart'),
                icon: Stack(children: [
                  const Icon(
                    Icons.shopping_cart,
                    size: 35,
                  ),
                  Positioned(
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Text(
                        cart.count.toString(),
                        style: const TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                ]),
              )
            ],
            bottom: TabBar(
                isScrollable: true,
                unselectedLabelColor: Colors.white,
                labelColor: Colors.yellow,
                overlayColor: MaterialStateProperty.all(Colors.black),
                tabs: const [
                  Tab(
                    icon: Icon(Icons.production_quantity_limits_rounded,
                        size: 27),
                  ),
                  Tab(
                    icon: Icon(Icons.devices, size: 27),
                  ),
                  Tab(
                    icon: Text('Jewe', style: TextStyle(fontSize: 19)),
                  ),
                  Tab(
                    icon: Text('Electro', style: TextStyle(fontSize: 19)),
                  ),
                  Tab(
                    icon: Text('Men', style: TextStyle(fontSize: 19)),
                  ),
                  Tab(
                    icon: Text('Women', style: TextStyle(fontSize: 19)),
                  ),
                ]),
          ),
          body: products.products == null
              ? const Center(child: CircularProgressIndicator())
              : TabBarView(children: [
                  RefreshIndicator(
                    onRefresh: products.refresh,
                    child: GridView(
                      // scrollDirection: Axis.horizontal,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 300, childAspectRatio: .55),
                      children: products.products!
                          .map((product) => ProductCard(product: product))
                          .toList(),
                    ),
                  ),
                  RefreshIndicator(
                    onRefresh: products.refresh,
                    child: ListView(
                      children: products.products!
                          .map((product) => ProductTile(product: product))
                          .toList(),
                    ),
                  ),
                  RefreshIndicator(
                    onRefresh: products.refresh,
                    child: GridView(
                      // scrollDirection: Axis.horizontal,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 300, childAspectRatio: .55),
                      children: products.products!
                          .map((product) => ProductCard(product: product))
                          .toList(),
                    ),
                  ),
                  RefreshIndicator(
                    onRefresh: products.refresh,
                    child: GridView(
                      // scrollDirection: Axis.horizontal,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 300, childAspectRatio: .55),
                      children: products.products!
                          .map((product) => ProductCard(product: product))
                          .toList(),
                    ),
                  ),
                  RefreshIndicator(
                    onRefresh: products.refresh,
                    child: GridView(
                      // scrollDirection: Axis.horizontal,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 300, childAspectRatio: .55),
                      children: products.products!
                          .map((product) => ProductCard(product: product))
                          .toList(),
                    ),
                  ),
                  RefreshIndicator(
                    onRefresh: products.refresh,
                    child: GridView(
                      // scrollDirection: Axis.horizontal,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 300, childAspectRatio: .55),
                      children: products.products!
                          .map((product) => ProductCard(product: product))
                          .toList(),
                    ),
                  ),
                ]),
          bottomNavigationBar: const MyBottomBar()),
    );
  }
}
