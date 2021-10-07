import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

const preferencesKey = 'auth';

class AuthState extends ChangeNotifier {
  SharedPreferences preferences;
  bool _loggedIn;

  AuthState(this.preferences)
      : _loggedIn = preferences.getBool(preferencesKey) ?? false;

  get loggedIn => _loggedIn;

  Future<bool> login(String username, String password) async {
    var response = await http.post(
      Uri.parse('https://fakestoreapi.com/auth/login'),
      headers: {'content-type': 'application/json'},
      body: jsonEncode({
        'username': username,
        'password': password,
      }),
    );

    var json = jsonDecode(response.body);

    if (json['token'] != null) {
      preferences.setBool(preferencesKey, true);
      _loggedIn = true;
      notifyListeners();
      return true;
    }

    return false;
  }
}
