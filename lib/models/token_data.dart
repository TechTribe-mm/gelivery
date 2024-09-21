class TokenData {
  final String accessToken;
  final String refreshToken;
  final int expiresIn;
  final String tokenType;
  final String scope;

  TokenData({
    required this.accessToken,
    required this.refreshToken,
    required this.expiresIn,
    required this.tokenType,
    required this.scope,
  });

  factory TokenData.fromJson(Map<String, dynamic> json) {
    return TokenData(
        accessToken: json['access_token'],
        refreshToken: json['refresh_token'],
        expiresIn: json['expires_in'],
        tokenType: json['token_type'],
        scope: json['scope']);
  }

  Map<String, dynamic> toJson() {
    return {
      'access_token': accessToken,
      'refresh_token': refreshToken,
      'expires_in': expiresIn,
      'token_type': tokenType,
      'scope': scope
    };
  }
}
