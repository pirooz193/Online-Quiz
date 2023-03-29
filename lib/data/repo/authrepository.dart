import 'package:flutter/material.dart';
import 'package:online_exam_test/common/http_client.dart';
import 'package:online_exam_test/data/authInfo.dart';
import 'package:online_exam_test/data/source/authDataSource.dart';
import 'package:shared_preferences/shared_preferences.dart';

final authRepository = AuthRepository(AuthDataSource(httpClient));

abstract class IAuthRepository {
  Future<void> login(String username, String password);
  Future<void> refreshToken(String username, String password);
  Future<void> signOut();
}

class AuthRepository implements IAuthRepository {
  static final ValueNotifier<AuthInfo?> authChangedNotifier =
      ValueNotifier(null);
  final IAuthDataSource dataSource;

  AuthRepository(this.dataSource);

  @override
  Future<void> login(String username, String password) async {
    final response = await dataSource.login(username, password);
    _persistAuthToken(response);
  }

  @override
  Future<void> refreshToken(String username, String password) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final AuthInfo authInfo = await dataSource
        .refreshToken(sharedPreferences.getString("refresh_token")!);
    _persistAuthToken(authInfo);
  }

  Future<void> _persistAuthToken(AuthInfo authInfo) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.setString("access_token", authInfo.accessToken);
    sharedPreferences.setString("refresh_token", authInfo.refreshToken);
    loadAuthInfo();
  }

  Future<void> loadAuthInfo() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    final String accessToken =
        sharedPreferences.getString("access_token") ?? '';
    final String refreshToken =
        sharedPreferences.getString("refresh_token") ?? '';
    if (accessToken.isNotEmpty && refreshToken.isNotEmpty) {
      authChangedNotifier.value = AuthInfo(accessToken, refreshToken);
    }
  }

  @override
  Future<void> signOut() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    sharedPreferences.clear();
    authChangedNotifier.value = null;
  }
}
