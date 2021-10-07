import 'package:flutter/material.dart';
import 'package:flutter_shop/components/counter.dart';
import 'package:flutter_shop/providers/cart.dart';
import 'package:flutter_shop/types/product.dart';
import 'package:provider/provider.dart';

class ProductTile extends StatelessWidget {
  final Product product;

  const ProductTile({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartState>(builder: (context, cart, child) {
      return ListTile(
        title: Text(
          product.title,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          product.description,
          overflow: TextOverflow.ellipsis,
        ),
        leading: Image.network(product.image, width: 60),
        trailing: Counter(
            value: cart.entries[product.id]?.quantity ?? 0,
            onUpdate: (count) =>
                cart.update(CartEntry(id: product.id, quantity: count))),
      );
    });
  }
}
