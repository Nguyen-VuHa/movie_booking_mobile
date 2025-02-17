import 'package:flutter/material.dart';
import 'package:movie_booking_mobile/models/common.dart';
import 'package:movie_booking_mobile/models/movie.dart';
import 'package:movie_booking_mobile/services/api_service.dart';

class MovieModel with ChangeNotifier {
  List<MovieDetail> _movie_now_showing = []; // Danh sách phim
  List<MovieDetail> _movie_comming_soon = []; // Danh sách phim
  bool _isLoading = false; // Trạng thái loading
  String? _errorMessage; // Lưu lỗi nếu có

  List<MovieDetail> get movie_now_showing => _movie_now_showing;
  List<MovieDetail> get movie_comming_soon => _movie_comming_soon;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  
  // Hàm fetch danh sách phim từ API
  Future<void> fetchMovies() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners(); // Cập nhật UI

    try {
      ApiResponse<MovieResponse>? response = await apiService.getMovie(); // Gọi API từ ApiService

      if(response != null && response.statusCode == 200) {
        _movie_now_showing = response.data.showing ?? []; // Gán dữ liệu nhận được
        _movie_comming_soon = response.data.comming_soon ?? []; // Gán dữ liệu nhận được
      }
    } catch (e) {
      _errorMessage = "Không thể tải danh sách phim!";
    }

    _isLoading = false;
    notifyListeners(); // Cập nhật lại UI
  }
}
