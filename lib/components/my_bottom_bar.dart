import 'package:flutter/material.dart';

class MyBottomBar extends StatelessWidget {
  const MyBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      IconButton(
        highlightColor: Colors.red,
        color: Colors.amber[900],
        onPressed: () => Navigator.of(context).pushNamed('/'),
        icon: const Icon(
          Icons.home,
          size: 35,
        ),
      ),
      const SizedBox(width: 40),
      IconButton(
        highlightColor: Colors.red,
        color: Colors.amber[900],
        onPressed: () => Navigator.of(context).pushNamed('/purchase'),
        icon: const Icon(
          Icons.delivery_dining_sharp,
          size: 35,
        ),
      ),
      const SizedBox(width: 40),
      IconButton(
        highlightColor: Colors.red,
        color: Colors.amber[900],
        onPressed: () => print('Gifts'),
        icon: const Icon(
          Icons.card_giftcard,
          size: 35,
        ),
      ),
      const SizedBox(width: 40),
      IconButton(
        highlightColor: Colors.red,
        color: Colors.amber[900],
        onPressed: () => Navigator.of(context).pushNamed('/feedback'),
        icon: const Icon(
          Icons.feedback_rounded,
          size: 35,
        ),
      )
    ]);
  }
}
