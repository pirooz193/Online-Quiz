import 'package:dio/dio.dart';
import 'package:online_exam_test/common/exception.dart';

mixin HttpResponseValidator {
  validateResponse(Response response) {
    if (response.statusCode != 200) {
      if (response.statusCode != 201) {
        throw AppException();
      }
    } else {}
  }
}
