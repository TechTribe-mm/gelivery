import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TrackingProvider with ChangeNotifier {
  Future<void> fetchTrackLists(String username, String password) async {
    notifyListeners();

    final url = Uri.parse('https://yourapi.com/v3/user/login');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'username': username,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        if (responseData['success']) {
          final data = responseData['data'];

          // Store tokens in SharedPreferences
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('access_token', data['access_token']);
          await prefs.setString('refresh_token', data['refresh_token']);
          await prefs.setInt(
            'expires_in',
            (DateTime.now().millisecondsSinceEpoch ~/ 1000) +
                (responseData['expires_in'] as int),
          );

          debugPrint('fetch successful!');
        } else {
          debugPrint('fetch failed: ${responseData['message']}');
        }
      } else {
        debugPrint('Server error: ${response.statusCode}');
      }
    } catch (error) {
      debugPrint('Error during fetchlist: $error');
    } finally {
      notifyListeners();
    }
  }
}
