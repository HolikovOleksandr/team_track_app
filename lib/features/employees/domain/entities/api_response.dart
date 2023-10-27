class ApiResponse<T> {
  final T? data;
  final bool success;
  final String? message;

  ApiResponse({
    required this.success,
    this.data,
    this.message,
  });

  factory ApiResponse.fromMap(Map<String, dynamic> map) {
    return ApiResponse(
      success: map['success'],
      data: map['data'],
      message: map['message'],
    );
  }
}
