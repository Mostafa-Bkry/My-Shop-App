import 'package:flutter/material.dart';
import 'package:flutter_shop/providers/auth.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _username = '';
  String _password = '';
  bool _isLoading = false;

  void _login() async {
    setState(() {
      _isLoading = true;
    });
    try {
      var loggedIn =
          await context.read<AuthState>().login(_username, _password);
      if (loggedIn) Navigator.pushReplacementNamed(context, '/');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('assets/zoro.gif'),
              radius: 150,
            ),
            const SizedBox(height: 20),
            TextField(
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              autocorrect: false,
              textCapitalization: TextCapitalization.none,
              decoration: const InputDecoration(
                label: Text('Username'),
                border: OutlineInputBorder(),
                filled: true,
              ),
              onChanged: (value) => setState(() {
                _username = value;
              }),
            ),
            const SizedBox(height: 8),
            TextField(
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.go,
              autocorrect: false,
              textCapitalization: TextCapitalization.none,
              obscureText: true,
              decoration: const InputDecoration(
                label: Text('Password'),
                border: OutlineInputBorder(),
                filled: true,
              ),
              onChanged: (value) => setState(() {
                _password = value;
              }),
              onSubmitted: (_) => _login(),
            ),
            ElevatedButton(
              onPressed: _isLoading ? null : () => _login(),
              child: const Text('Login'),
            )
          ],
        ),
      ),
    );
  }
}
