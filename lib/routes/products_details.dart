import 'package:flutter/material.dart';
import 'package:flutter_shop/components/counter.dart';
import 'package:flutter_shop/providers/cart.dart';
import 'package:flutter_shop/providers/favorites.dart';
import 'package:provider/provider.dart';

MaterialPageRoute materialPageRoute({
  required int id,
  required String image,
  required String title,
  required String description,
  required double price,
  required String category,
}) {
  return MaterialPageRoute(builder: (BuildContext context) {
    var cart = Provider.of<CartState>(context);
    var favoritesState = context.watch<FavoritesState>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          title.substring(0, 11),
          style: const TextStyle(
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
        actions: [
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
                      color: Colors.blue[800],
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
      ),
      body: ListView(children: [
        Card(
          clipBehavior: Clip.hardEdge,
          elevation: 25,
          child: Column(children: [
            Text('Category', style: Theme.of(context).textTheme.headline6),
            Center(
              child: Text(
                category.toUpperCase(),
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            const SizedBox(height: 10),
            AspectRatio(
              aspectRatio: 1,
              child: Stack(children: [
                Image.network(image, fit: BoxFit.cover),
                ConstrainedBox(
                  constraints: const BoxConstraints.expand(),
                  child: Material(
                    color: Colors.transparent,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                          onPressed: () => favoritesState.toggle(id),
                          icon: favoritesState.ids.contains(id)
                              ? const Icon(Icons.favorite, color: Colors.red)
                              : const Icon(Icons.favorite_border)),
                    ),
                  ),
                ),
              ]),
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(title, style: Theme.of(context).textTheme.headline5),
                      const SizedBox(height: 10),
                      Text(description,
                          style: Theme.of(context).textTheme.caption),
                    ])),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 170,
                alignment: Alignment.center,
                color: Colors.blue[800],
                child: Text(
                  price.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    letterSpacing: 5,
                    shadows: [
                      Shadow(color: Colors.white, blurRadius: 8),
                    ],
                    fontWeight: FontWeight.w700,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            Counter(
                value: cart.entries[id]?.quantity ?? 0,
                onUpdate: (count) =>
                    cart.update(CartEntry(id: id, quantity: count))),
            ElevatedButton(
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(const Size(0, 40)),
                  elevation: MaterialStateProperty.all(15),
                  overlayColor: MaterialStateProperty.all(Colors.yellow),
                  alignment: Alignment.center,
                  backgroundColor: MaterialStateProperty.all(Colors.blue[800])),
              onPressed: () => Navigator.of(context).pushNamed('/purchase'),
              child: const Text(
                'Buy',
                style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 5,
                    shadows: [
                      Shadow(color: Colors.white, blurRadius: 15),
                    ],
                    fontSize: 27),
              ),
            ),
            const SizedBox(height: 5),
          ]),
        ),
      ]),
    );
  });
}
