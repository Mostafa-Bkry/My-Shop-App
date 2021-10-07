import 'package:flutter/material.dart';
import 'package:flutter_shop/components/counter.dart';
import 'package:flutter_shop/providers/cart.dart';
import 'package:flutter_shop/providers/favorites.dart';
import 'package:flutter_shop/types/product.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var favoritesState = context.watch<FavoritesState>();

    return Consumer<CartState>(
      builder: (context, cart, child) => Card(
        clipBehavior: Clip.hardEdge,
        elevation: 15,
        child: Column(children: [
          Flexible(child: Container()),
          AspectRatio(
            aspectRatio: 1,
            child: Stack(children: [
              Image.network(product.image, fit: BoxFit.cover),
              ConstrainedBox(
                constraints: const BoxConstraints.expand(),
                child: Material(
                  color: Colors.transparent,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                        onPressed: () => favoritesState.toggle(product.id),
                        icon: favoritesState.ids.contains(product.id)
                            ? const Icon(Icons.favorite, color: Colors.red)
                            : const Icon(Icons.favorite_border)),
                  ),
                ),
              ),
            ]),
          ),
          Flexible(child: Container()),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(product.title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.headline6),
                    Text(product.description,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: Theme.of(context).textTheme.caption),
                  ])),
          Flexible(child: Container()),
          Counter(
              value: cart.entries[product.id]?.quantity ?? 0,
              onUpdate: (count) =>
                  cart.update(CartEntry(id: product.id, quantity: count))),
          Flexible(
            child: Container(color: Colors.red),
          )
        ]),
      ),
    );
  }
}
