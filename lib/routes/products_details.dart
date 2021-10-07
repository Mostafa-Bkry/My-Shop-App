import 'package:flutter/material.dart';
import 'package:flutter_shop/components/counter.dart';
import 'package:flutter_shop/providers/cart.dart';
import 'package:provider/provider.dart';

MaterialPageRoute materialPageRoute(
    {required int id,
    required String image,
    required String title,
    required String description}) {
  return MaterialPageRoute(builder: (BuildContext context) {
    var cart = Provider.of<CartState>(context);

    return Scaffold(
      appBar: AppBar(),
      body: Card(
        clipBehavior: Clip.hardEdge,
        elevation: 15,
        child: Column(children: [
          Flexible(child: Container()),
          AspectRatio(
            aspectRatio: 1,
            child: Image.network(image, fit: BoxFit.cover),
          ),
          Flexible(child: Container()),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.headline6),
                    Text(description,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: Theme.of(context).textTheme.caption),
                  ])),
          Flexible(child: Container()),
          Counter(
              value: cart.entries[id]?.quantity ?? 0,
              onUpdate: (count) =>
                  cart.update(CartEntry(id: id, quantity: count))),
          Flexible(
            child: Container(color: Colors.red),
          )
        ]),
      ),
    );
  });
}

// import 'package:flutter/material.dart';
// import 'package:flutter_shop/components/my_bottom_bar.dart';
// import 'package:flutter_shop/components/product_card.dart';
// import 'package:flutter_shop/providers/cart.dart';
// import 'package:flutter_shop/providers/products.dart';
// import 'package:provider/provider.dart';

// class ProductDetails extends StatelessWidget {
//   const ProductDetails({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var cart = context.watch<CartState>();
//     var products = context.watch<ProductsState>();

//     return Scaffold(
//         // drawer: const MyDrawer(),
//         appBar: AppBar(
//             leading: IconButton(
//                 onPressed: () => Navigator.of(context).pushNamed('/'),
//                 icon: const Icon(Icons.arrow_back_ios)),
//             centerTitle: true,
//             backgroundColor: Colors.red[800],
//             title: Row(mainAxisSize: MainAxisSize.min, children: const [
//               Text(
//                 'Buy',
//                 style: TextStyle(
//                     letterSpacing: 5,
//                     shadows: [
//                       Shadow(color: Colors.white, blurRadius: 15),
//                     ],
//                     fontSize: 27),
//               ),
//             ]),
//             actions: [
//               IconButton(
//                 onPressed: () => Navigator.of(context).pushNamed('/cart'),
//                 icon: Stack(children: [
//                   const Icon(
//                     Icons.shopping_cart,
//                     size: 35,
//                   ),
//                   Positioned(
//                     right: 0,
//                     child: Container(
//                       decoration: BoxDecoration(
//                           color: Colors.red,
//                           borderRadius: BorderRadius.circular(10)),
//                       padding: const EdgeInsets.symmetric(horizontal: 4),
//                       child: Text(
//                         cart.count.toString(),
//                         style: const TextStyle(fontSize: 15),
//                       ),
//                     ),
//                   ),
//                 ]),
//               ),
//             ]),
//         body: products.products == null
//             ? const Center(child: CircularProgressIndicator())
//             : GridView(
//                 // scrollDirection: Axis.horizontal,
//                 gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//                     maxCrossAxisExtent: 800, childAspectRatio: .6),
//                 children: products.products!
//                     .map((product) => ProductCard(product: product))
//                     .toList(),
//               ),
//         bottomNavigationBar: const MyBottomBar());
//   }
// }
