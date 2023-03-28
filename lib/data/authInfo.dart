class AuthInfo {
  final String accessToken;
  final String refreshToken;

  AuthInfo.frmJson(Map<String, dynamic> json)
      : accessToken = json['access_token'],
        refreshToken = json['refresh_token'];
}
