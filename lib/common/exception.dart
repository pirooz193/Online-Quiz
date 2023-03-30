class AppException {
  final String message;

  AppException({this.message = 'Undefined Error !'});
}

class InternalServerError extends AppException {
  // @override
  // final String message;
  InternalServerError({super.message = 'Server is not responsible !'});
}

class NotFoundException extends AppException {
  // @override
  // final String message;
  NotFoundException({super.message = 'Not found anything !'});
}
