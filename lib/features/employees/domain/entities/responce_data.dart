 class ApiResponse<T> {
  final T? data;
  final bool success;
  final String? message;

  ApiResponse({
    required this.success,
    this.data,
    this.message,
  });
}
