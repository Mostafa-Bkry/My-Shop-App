import 'package:flutter/material.dart';
import 'package:flutter_shop/components/my_bottom_bar.dart';

class UserFeedback extends StatelessWidget {
  const UserFeedback({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Feedback',
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const TextField(
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
            textCapitalization: TextCapitalization.none,
            decoration: InputDecoration(
              label: Text('FeedBack'),
              border: OutlineInputBorder(),
              filled: true,
              hintMaxLines: 10,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => print('Sent'),
            child: const Text(
              'Send',
              style: TextStyle(fontSize: 20),
            ),
          )
        ],
      ),
      bottomNavigationBar: const MyBottomBar(),
    );
  }
}
