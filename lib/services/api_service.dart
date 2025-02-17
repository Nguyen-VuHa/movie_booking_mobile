


import 'package:dio/dio.dart';
import 'package:movie_booking_mobile/configs/dio_config.dart';
import 'package:movie_booking_mobile/models/common.dart';
import 'package:movie_booking_mobile/models/movie.dart';

class ApiService { 
  Future<ApiResponse<MovieResponse>?> getMovie() async {
    try {
    Response response = await dioClient.dio.get('/api/movie');
    
    if (response.data is Map<String, dynamic>) {
        return ApiResponse<MovieResponse>.fromJson(
          response.data,
          (data) => MovieResponse.fromJson(data as Map<String, dynamic>),
        );
    } else {
      print("⚠️ API trả về không đúng định dạng");
      return null;
    }
  } catch (e) {
    print("🚨 Lỗi API: $e");
    return null;
  }
  }
}

final apiService = ApiService();