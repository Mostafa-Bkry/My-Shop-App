import 'package:flutter/material.dart';

class Counter extends StatelessWidget {
  final int value;
  final Function(int) onUpdate;

  const Counter({Key? key, required this.value, required this.onUpdate})
      : super(key: key);

  _increment() {
    onUpdate(value + 1);
  }

  _decrement() {
    if (value <= 0) return;
    onUpdate(value - 1);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      // mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          onPressed: value > 0 ? _decrement : null,
          icon: const Icon(
            Icons.remove_circle,
            size: 25,
          ),
        ),
        Text(value.toString(),
            style: const TextStyle(
                fontSize: 25,
                fontStyle: FontStyle.italic,
                shadows: [Shadow(color: Colors.black, blurRadius: 8)])),
        IconButton(
            onPressed: _increment,
            icon: const Icon(Icons.add_circle),
            iconSize: 30,
            color: Colors.blue[800]),
      ],
    );
  }
}
