class ApiResponse<T> {
  final T data;
  final String message;
  final int statusCode;
  final dynamic error;

  ApiResponse({
    required this.data,
    required this.message,
    required this.statusCode,
    required this.error,
  });

  // Chuyển từ JSON -> Object
  factory ApiResponse.fromJson(Map<String, dynamic> json, T Function(dynamic) fromJsonT) {
    return ApiResponse<T>(
      data: fromJsonT(json['data']), // Chuyển đổi T từ JSON
      message: json['message'] ?? '',
      statusCode: json['statusCode'] ?? 200,
      error: json['error'] ?? null,
    );
  }

  // Chuyển từ Object -> JSON
  Map<String, dynamic> toJson() {
    return {
      'data': data,
      'message': message,
      'statusCode': statusCode,
      'error': error,
    };
  }
}