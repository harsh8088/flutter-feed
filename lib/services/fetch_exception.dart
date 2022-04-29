class FetchDataException implements Exception {
  String message;
  FetchDataException(this.message);

  @override
  String toString() {
    return "Exception: $message";
  }
}
