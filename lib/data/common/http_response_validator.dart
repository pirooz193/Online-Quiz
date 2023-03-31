import 'package:dio/dio.dart';
import 'package:online_exam_test/common/exception.dart';

mixin HttpResponseValidator {
  validateResponse(Response response) {
    if (response.statusCode != 200) {
      if (response.statusCode != 201) {
        if (response.statusCode == 404) {
          throw NotFoundException();
        }
        if (response.statusCode == 500) {
          throw NotFoundException();
        }
      } else {
        // throw AppException();
      }
    } else {}
  }
}
