import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gelivery/models/login_response.dart';
import 'package:gelivery/repository/api_routes.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider with ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<String> login(
    dynamic payLoadObj,
  ) async {
    _isLoading = true;
    notifyListeners();

    // final url = Uri.parse('https://dev.gigagates.com/qq-delivery-backend/v3/user/login');
    final url = Uri.parse('$uri$loginUrl');
    debugPrint('url $url & $payLoadObj');
    try {
      final response = await http.post(url,
          headers: {
            'Content-Type': 'application/json',
            'access-control-allow-origin': '*'
          },
          body: payLoadObj);
      debugPrint("response ${response.body} ${response.headers}");
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        LoginResponse loginResponse = LoginResponse.fromJson(responseData);

        if (loginResponse.success) {
          debugPrint('Access Token: ${loginResponse.data?.accessToken}');

          // Save tokens to SharedPreferences
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('accessToken', loginResponse.data!.accessToken);
          await prefs.setString(
              'refreshToken', loginResponse.data!.refreshToken);
          await prefs.setInt('expiresIn', loginResponse.data!.expiresIn);
          debugPrint('Refresh Token: ${loginResponse.data?.refreshToken}');
          debugPrint('Expire In: ${loginResponse.data?.expiresIn}');
          debugPrint("Tokens saved in SharedPreferences");
          return loginResponse.message;
        } else {
          debugPrint('Login failed: ${loginResponse.message}');
          return loginResponse.message;
        }
      } else {
        debugPrint('Server error: ${response.statusCode}');
        return response.statusCode.toString();
      }
    } catch (error) {
      debugPrint('Error during login: $error');
      return error.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Future<void> revokeToken() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? accessToken = prefs.getString('access_token');
  //   String? refreshToken = prefs.getString('refresh_token');

  //   if (accessToken == null || refreshToken == null) {
  //    debugPrint('No tokens to revoke');
  //     return;
  //   }

  //   final url = Uri.parse('$uri$revokeUrl');

  //   try {
  //     final response = await http.post(
  //       url,
  //       headers: {
  //         'Authorization': 'Bearer $accessToken',
  //         'Content-Type': 'application/json'
  //       },
  //       body: jsonEncode({
  //         'token': accessToken,
  //         'refresh_token': refreshToken,
  //       }),
  //     );

  //     if (response.statusCode == 200) {
  //      debugPrint('Token revoked successfully');
  //       await prefs.clear();
  //     } else {
  //      debugPrint('Failed to revoke token: ${response.statusCode}');
  //     }
  //   } catch (error) {
  //    debugPrint('Error during token revocation: $error');
  //   }
  // }

  Future<bool> isTokenExpired() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? expiresIn = prefs.getInt('expires_in');
    if (expiresIn == null) {
      return true;
    }
    int currentTime = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    return currentTime > expiresIn;
  }

  Future<void> refreshToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? refreshToken = prefs.getString('accessToken');

    final url = Uri.parse('$uri$refreshToken');
    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'accessToken': refreshToken,
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        LoginResponse loginResponse = LoginResponse.fromJson(responseData);
        if (loginResponse.success) {
          debugPrint('Access Token: ${loginResponse.data?.accessToken}');

          // Save tokens to SharedPreferences
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('accessToken', loginResponse.data!.accessToken);
          await prefs.setString(
              'refreshToken', loginResponse.data!.refreshToken);
          await prefs.setInt('expiresIn', loginResponse.data!.expiresIn);
          debugPrint('Refresh Token: ${loginResponse.data?.refreshToken}');
          debugPrint('Expire In: ${loginResponse.data?.expiresIn}');

          // await prefs.setInt(
          //   'expires_in',
          //   (DateTime.now().millisecondsSinceEpoch ~/ 1000) +
          //       (responseData['expires_in'] as int),
          // );
          debugPrint("Tokens saved in SharedPreferences");
          debugPrint('Token refreshed successfully');
        } else {
          debugPrint('Failed to refresh token: ${response.statusCode}');
        }
      } else {
        debugPrint('Server error: ${response.statusCode}');
        debugPrint(response.statusCode.toString());
      }
    } catch (error) {
      debugPrint('Error during token refresh: $error');
    }
  }
}
