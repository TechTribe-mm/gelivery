import 'package:gelivery/models/token_data.dart';

class LoginResponse {
  final bool success;
  final String message;
  final TokenData? data;
  final String timeStamp;

  LoginResponse(
      {required this.success,
      required this.message,
      this.data,
      required this.timeStamp});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
        success: json['success'],
        message: json['message'],
        data: json['data'] != null ? TokenData.fromJson(json['data']) : null,
        timeStamp: json['timestamp']);
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': data?.toJson(),
      'timestamp': timeStamp
    };
  }
}
