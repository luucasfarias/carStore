class ApiResponse<T> {
  bool status;
  String message;
  T result;

  ApiResponse.success(this.result) {
    status = true;
  }

  ApiResponse.error(this.message) {
    status = false;
  }
}
