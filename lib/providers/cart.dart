import 'package:flutter/material.dart';

class CartState extends ChangeNotifier {
  var entries = <int, CartEntry>{};

  void update(CartEntry entry) {
    if (entry.quantity <= 0) {
      entries.remove(entry.id);
      notifyListeners();
      return;
    }

    entries[entry.id] = entry;
    notifyListeners();
  }

  void clear() {
    entries = {};
    notifyListeners();
  }

  int get count {
    return entries.values
        .map((entry) => entry.quantity)
        .fold<int>(0, (a, b) => a + b);

    // var entriesIterable = entries.values;

    // var count = 0;

    // for (var entry in entriesIterable) {
    //   count += entry.quantity;
    // }

    // return count;
  }
}

class CartEntry {
  final int id;
  final int quantity;

  CartEntry({required this.id, required this.quantity});
}
