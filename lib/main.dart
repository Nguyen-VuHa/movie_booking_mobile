import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_booking_mobile/layouts/main_layout.dart';
import 'package:movie_booking_mobile/providers/provider_config.dart';
import 'package:provider/provider.dart';

void main() async {
  try {
    await dotenv.load(fileName: ".env"); // Load file .env
  } catch (e) {
    print("⚠️ Lỗi khi load .env: $e"); // Debug lỗi
  }

  runApp(
    MultiProvider(
      providers: getProviders(), // Import danh sách provider từ file riêng biệt
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // initialRoute: AppRoutes.home,
      // routes: AppPages.getRoutes(),
      home: MainLayout(),
    );
  }
}
