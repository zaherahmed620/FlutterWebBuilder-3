import 'dart:convert';
import 'package:http/http.dart' as http;
import '../utils/constants.dart';
import '../models/models.dart';

class ApiService {
  final String baseUrl = Constants.apiBaseUrl;
  final String apiKey = Constants.apiKey;

  // تسجيل الدخول
  Future<Map<String, dynamic>> loginUser(String phone, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login_user.php'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'api_key': apiKey,
        'phone': phone,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('فشل تسجيل الدخول: ${response.statusCode}');
    }
  }

  // تسجيل مستخدم جديد
  Future<Map<String, dynamic>> registerUser(UserRegistration user) async {
    final response = await http.post(
      Uri.parse('$baseUrl/register_user.php'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'api_key': apiKey,
        'name': user.name,
        'phone': user.phone,
        'email': user.email,
        'password': user.password,
      }),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('فشل تسجيل المستخدم: ${response.statusCode}');
    }
  }

  // الحصول على الفئات
  Future<List<Category>> getCategories() async {
    final response = await http.get(
      Uri.parse('$baseUrl/get_categories.php?api_key=$apiKey'),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      if (jsonResponse['status'] == 'success') {
        List<dynamic> categoriesJson = jsonResponse['data'];
        return categoriesJson.map((json) => Category.fromJson(json)).toList();
      } else {
        throw Exception(jsonResponse['message']);
      }
    } else {
      throw Exception('فشل جلب الفئات: ${response.statusCode}');
    }
  }

  // الحصول على الخدمات
  Future<List<Service>> getServices() async {
    final response = await http.get(
      Uri.parse('$baseUrl/get_services.php?api_key=$apiKey'),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      if (jsonResponse['status'] == 'success') {
        List<dynamic> servicesJson = jsonResponse['data'];
        return servicesJson.map((json) => Service.fromJson(json)).toList();
      } else {
        throw Exception(jsonResponse['message']);
      }
    } else {
      throw Exception('فشل جلب الخدمات: ${response.statusCode}');
    }
  }
}