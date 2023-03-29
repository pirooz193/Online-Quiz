import 'package:dio/dio.dart';
import 'package:online_exam_test/data/authInfo.dart';
import 'package:online_exam_test/data/common/http_response_validator.dart';

abstract class IAuthDataSource {
  Future<AuthInfo> login(String username, String password);
  Future<AuthInfo> refreshToken(String refreshToken);
}

class AuthDataSource with HttpResponseValidator implements IAuthDataSource {
  final Dio httpClient;

  AuthDataSource(this.httpClient);

  @override
  Future<AuthInfo> login(String username, String password) async {
    final response = await httpClient.post(
      '/get-token',
      data: {"username": username, "password": password},
      options: Options(contentType: Headers.formUrlEncodedContentType),
    );
    validateResponse(response);
    return AuthInfo(
        response.data['access_token'], response.data['refresh_token']);
  }

  @override
  Future<AuthInfo> refreshToken(String refreshToken) async {
    final response = await httpClient
        .post('/refresh-token', data: {"refresh-token", refreshToken});
    validateResponse(response);
    return AuthInfo(
        response.data['access_token'], response.data['refresh_token']);
  }
}
