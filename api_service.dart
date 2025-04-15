import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  // API configuration
  static const String baseUrl = 'https://yemenmazady.com/api/';
  static const String apiKey = '9fedcbced6b38503dcae6c8e1f766a2d';
  
  // HTTP client
  final http.Client _client = http.Client();
  
  // Singleton instance
  static final ApiService _instance = ApiService._internal();
  
  // Factory constructor
  factory ApiService() {
    return _instance;
  }
  
  // Internal constructor
  ApiService._internal();
  
  // Helper method to add API key to request body
  Map<String, dynamic> _addApiKey(Map<String, dynamic> body) {
    final Map<String, dynamic> requestBody = Map.from(body);
    requestBody['api_key'] = apiKey;
    return requestBody;
  }
  
  // Generic POST request method
  Future<Map<String, dynamic>> post(String endpoint, Map<String, dynamic> body) async {
    final requestBody = _addApiKey(body);
    
    try {
      final response = await _client.post(
        Uri.parse('$baseUrl$endpoint'),
        body: requestBody,
      );
      
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to make API request. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('API request failed: $e');
    }
  }
  
  // Generic GET request method
  Future<Map<String, dynamic>> get(String endpoint, [Map<String, dynamic>? queryParams]) async {
    final Map<String, dynamic> params = queryParams ?? {};
    params['api_key'] = apiKey;
    
    final Uri uri = Uri.parse('$baseUrl$endpoint').replace(
      queryParameters: params.map((key, value) => MapEntry(key, value.toString())),
    );
    
    try {
      final response = await _client.get(uri);
      
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to make API request. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('API request failed: $e');
    }
  }
  
  // Authentication methods
  Future<Map<String, dynamic>> login(String email, String password) async {
    return await post('login_user.php', {
      'email': email,
      'password': password,
    });
  }
  
  Future<Map<String, dynamic>> register(String name, String email, String password) async {
    return await post('register_user.php', {
      'name': name,
      'email': email,
      'password': password,
    });
  }
  
  // Data retrieval methods
  Future<List<dynamic>> getCategories() async {
    final response = await get('get_categories.php');
    return response['categories'] ?? [];
  }
  
  Future<List<dynamic>> getServices([String? categoryId]) async {
    final Map<String, dynamic> queryParams = {};
    if (categoryId != null) {
      queryParams['category_id'] = categoryId;
    }
    
    final response = await get('get_services.php', queryParams);
    return response['services'] ?? [];
  }
  
  Future<Map<String, dynamic>> getServiceDetails(String serviceId) async {
    final response = await get('get_service_details.php', {'service_id': serviceId});
    return response['service'] ?? {};
  }
  
  // User profile methods
  Future<Map<String, dynamic>> getUserProfile(String userId) async {
    return await get('get_user_profile.php', {'user_id': userId});
  }
  
  Future<Map<String, dynamic>> updateUserProfile(String userId, Map<String, dynamic> userData) async {
    final requestBody = Map<String, dynamic>.from(userData);
    requestBody['user_id'] = userId;
    
    return await post('update_user_profile.php', requestBody);
  }
  
  // Booking/Order methods
  Future<Map<String, dynamic>> createBooking(String userId, String serviceId, Map<String, dynamic> bookingData) async {
    final requestBody = Map<String, dynamic>.from(bookingData);
    requestBody['user_id'] = userId;
    requestBody['service_id'] = serviceId;
    
    return await post('create_booking.php', requestBody);
  }
  
  Future<List<dynamic>> getUserBookings(String userId) async {
    final response = await get('get_user_bookings.php', {'user_id': userId});
    return response['bookings'] ?? [];
  }
  
  // Dispose method to close HTTP client
  void dispose() {
    _client.close();
  }
}