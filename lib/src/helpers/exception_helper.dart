class ExceptionHelper {
  static Exception convertCodeToException(String message) {
    return CustomError(message: message);
  }
}

class CustomError implements Exception {
  final String message;

  CustomError({
    this.message = "Error",
  });
  @override
  String toString() {
    return message;
  }
}
