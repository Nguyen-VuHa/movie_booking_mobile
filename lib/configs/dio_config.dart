import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class DioClient {
  late Dio dio;
  final FlutterSecureStorage storage = FlutterSecureStorage(); // Lưu token an toàn

  DioClient() {
    dio = Dio(
      BaseOptions(
        baseUrl: dotenv.env['API_BASE_URL'] ?? "http://localhost:3000",
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );

    // Thêm Interceptor
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        // 🔥 Lấy access_token từ storage và thêm vào request
        String? token = await storage.read(key: "access_token");
        if (token != null) {
          options.headers['Authorization'] = "Bearer $token";
        }
        print("🚀 Request: ${options.method} ${options.path}");
        return handler.next(options);
      },
      onResponse: (response, handler) {
        // ✅ Xử lý khi API trả về thành công
        print("✅ Response: ${response.statusCode}");
        return handler.next(response);
      },
      onError: (DioException e, handler) async {
        if (e.response?.statusCode == 401) {
          // 🔄 Lỗi 401 -> Thử refresh token
          print("🔄 Token hết hạn, thử refresh token...");
          bool refreshed = await _refreshToken();
          if (refreshed) {
            // Thử gửi lại request nếu refresh thành công
            return handler.resolve(await _retryRequest(e.requestOptions));
          } else {
            // Nếu refresh thất bại, logout user
            await _logout();
          }
        } else if (e.response?.statusCode == 403) {
          // ❌ Lỗi 403 -> Logout và đá về màn hình đăng nhập
          print("🚨 Lỗi 403: Xóa token và logout!");
          await _logout();
        }
        return handler.next(e);
      },
    ));
  }

  // 📌 Hàm refresh token
  Future<bool> _refreshToken() async {
    try {
      String? refreshToken = await storage.read(key: "refresh_token");
      if (refreshToken == null) return false;

      Response response = await dio.post('/auth/refresh', data: {
        "refresh_token": refreshToken,
      });

      if (response.statusCode == 200) {
        // Lưu token mới
        await storage.write(key: "access_token", value: response.data['access_token']);
        await storage.write(key: "refresh_token", value: response.data['refresh_token']);
        print("🔄 Refresh token thành công!");
        return true;
      }
    } catch (e) {
      print("❌ Refresh token thất bại: $e");
    }
    return false;
  }

  // 📌 Gửi lại request sau khi refresh token thành công
  Future<Response> _retryRequest(RequestOptions requestOptions) async {
    String? newToken = await storage.read(key: "access_token");
    if (newToken != null) {
      requestOptions.headers['Authorization'] = "Bearer $newToken";
    }
    return dio.fetch(requestOptions);
  }

  // 📌 Xóa token và logout
  Future<void> _logout() async {
    await storage.delete(key: "access_token");
    await storage.delete(key: "refresh_token");
    print("🚪 Người dùng bị logout do lỗi 403 hoặc refresh token thất bại.");
    // TODO: Điều hướng về màn hình login tại đây
  }
}

// Tạo một instance dùng chung
final dioClient = DioClient();
