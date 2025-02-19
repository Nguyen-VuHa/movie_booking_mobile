import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final storage = FlutterSecureStorage();

Future<void> saveToken(String token) async {
  await storage.write(key: "access_token", value: token);
}

Future<String?> getToken() async {
  return await storage.read(key: "access_token");
}

Future<void> deleteToken() async {
  await storage.delete(key: "access_token");
}
