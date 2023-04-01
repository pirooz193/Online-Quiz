import 'package:dio/dio.dart';
import 'package:online_exam_test/data/repo/authrepository.dart';

final httpClient = Dio(BaseOptions(
  baseUrl: 'http://localhost:8080/api/',
))
  ..interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) {
      final authInfo = AuthRepository.authChangedNotifier.value;
      if (authInfo != null && authInfo.accessToken.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer ${authInfo.accessToken}';
      }

      handler.next(options);
    },
  ));
