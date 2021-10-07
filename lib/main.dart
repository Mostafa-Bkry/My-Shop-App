import 'package:flutter/material.dart';
import 'package:flutter_shop/providers/auth.dart';
import 'package:flutter_shop/providers/cart.dart';
import 'package:flutter_shop/providers/favorites.dart';
import 'package:flutter_shop/providers/products.dart';
import 'package:flutter_shop/routes/apply_purchase.dart';
import 'package:flutter_shop/routes/cart.dart';
import 'package:flutter_shop/routes/favorites.dart';
import 'package:flutter_shop/routes/feedback.dart';
import 'package:flutter_shop/routes/home.dart';
import 'package:flutter_shop/routes/login.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var preferences = await SharedPreferences.getInstance();
  runApp(MyApp(preferences: preferences));
}

class MyApp extends StatelessWidget {
  final SharedPreferences preferences;

  const MyApp({Key? key, required this.preferences}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => preferences,
      child: ChangeNotifierProvider<AuthState>(
        create: (_) => AuthState(preferences),
        child: ChangeNotifierProvider<ProductsState>(
          create: (_) => ProductsState(),
          child: ChangeNotifierProvider<CartState>(
            create: (_) => CartState(),
            child: ChangeNotifierProvider<FavoritesState>(
              create: (_) => FavoritesState(preferences),
              child: Builder(
                builder: (context) => MaterialApp(
                  title: 'Shopee',
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(splashColor: Colors.black),
                  darkTheme: ThemeData.dark(),
                  initialRoute:
                      context.read<AuthState>().loggedIn ? '/' : '/login',
                  routes: {
                    '/': (_) => const HomePage(),
                    '/login': (_) => const LoginPage(),
                    '/cart': (_) => const CartPage(),
                    '/favorites': (_) => const FavoritesPage(),
                    '/purchase': (_) => const ApplyPurchase(),
                    '/feedback': (_) => const UserFeedback(),
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
