import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../const/api_urls.dart';
import '../model/login_request_model.dart';
import '../model/user_model.dart';

class AuthApi {

  static const storage = FlutterSecureStorage();

  static Future<int?> login(String username, String password) async {
    try{
      print(LoginRequest.toJson(LoginRequest(username, password)));
      final response = await http.post(
        Uri.parse('${ApiUrls.baseUrl}/auth/login'),
        // headers: {'Content-Type': 'application/json'},
        body: {
          'username': username,
          'password':password,
        },
      );
      if (response.statusCode == 200) {
        final data = User.fromJson(jsonDecode(response.body));
        final token = data.token;
        await storage.write(key: 'auth_token', value: token);
        await storage.write(key: 'user_id', value: data.id.toString());
        return response.statusCode;
      } else {
        print('Login failed: ${response.statusCode}');
        return null;
      }
    }catch(error){
      print("Error: $error");
    }
  }

  static Future<void> logout() async {
    await storage.delete(key: 'auth_token');
  }

  static Future<String?> getAuthToken() async {
    return await storage.read(key: 'auth_token');
  }
}
