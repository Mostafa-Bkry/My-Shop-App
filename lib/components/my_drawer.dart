import 'package:flutter/material.dart';
import 'package:flutter_shop/providers/cart.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var cart = context.watch<CartState>();

    return Drawer(
      elevation: 30,
      child: SafeArea(
        child: Container(
          color: Colors.blue[800],
          child: ListView(children: [
            const SizedBox(height: 40),
            Column(mainAxisSize: MainAxisSize.min, children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 15, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.account_circle_rounded,
                      color: Colors.amber[100],
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      'My Account',
                      style: TextStyle(
                        letterSpacing: 5,
                        shadows: [
                          Shadow(color: Colors.white, blurRadius: 15),
                        ],
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/zoro.gif'),
                  radius: 60,
                ),
              ),
              const Divider(
                height: 15,
                color: Colors.white,
                thickness: 1,
                indent: 40,
                endIndent: 40,
              ),
              const SizedBox(height: 40),
              AspectRatio(
                aspectRatio: 2 / 1.8,
                child: Card(
                  elevation: 50,
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(children: [
                      const Text(
                        'mor_2314',
                        style: TextStyle(
                          letterSpacing: 5,
                          shadows: [
                            Shadow(color: Colors.black, blurRadius: 15),
                          ],
                          fontWeight: FontWeight.w700,
                          fontSize: 25,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(15.0),
                        child:
                            Text('Purshased', style: TextStyle(fontSize: 17)),
                      ),
                      Text(
                        cart.count.toString(),
                        style: const TextStyle(
                            letterSpacing: 5,
                            shadows: [
                              Shadow(color: Colors.black, blurRadius: 15),
                            ],
                            fontSize: 37),
                      ),
                      const SizedBox(height: 20),
                      IconButton(
                        highlightColor: Colors.red,
                        color: Colors.red[800],
                        onPressed: () =>
                            Navigator.of(context).pushNamed('/login'),
                        icon: const Icon(
                          Icons.logout_rounded,
                          size: 40,
                        ),
                      ),
                      const Text('Log Out'),
                    ]),
                  ),
                ),
              )
            ]),
          ]),
        ),
      ),
    );
  }
}
