import 'package:dio/dio.dart';
import 'package:gelivery/models/login_response.dart';
import 'package:gelivery/models/pickup_data.dart';
import 'package:gelivery/repository/api_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  final Dio _dio = Dio();
  late final LoginResponse login;

  Future<PickupListResponse> getPickupList(int first, int max) async {
    final pickList = '$uri$picklistUrl';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('accessToken');
    try {
      final response = await _dio.post(
        '$pickList',
        data: {'first': first, 'max': max},
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );

      if (response.statusCode == 200) {
        return PickupListResponse.fromJson(response.data);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }

  Future<void> logout() async {
    final revokeAccess = '$uri$revokeUrl';
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('accessToken');
    print("accessToken logout $token");
    try {
      await _dio.post(
        revokeAccess,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );
      await prefs
          .clear(); // Clear all preferences (access token and other data)

      // Clear the user model
      login.toJson(); // check this one
      // Clear the token after revoke
    } catch (e) {
      throw Exception('Error during logout: $e');
    }
  }
}
