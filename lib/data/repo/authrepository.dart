import 'package:online_exam_test/common/http_client.dart';
import 'package:online_exam_test/data/authInfo.dart';
import 'package:online_exam_test/data/source/authDataSource.dart';

final authRepository = AuthRepository(AuthDataSource(httpClient));

abstract class IAuthRepository {
  Future<AuthInfo> login(String username, String password);
}

class AuthRepository implements IAuthRepository {
  final IAuthDataSource dataSource;

  AuthRepository(this.dataSource);

  @override
  Future<AuthInfo> login(String username, String password) {
    return dataSource.login(username, password);
  }
}
