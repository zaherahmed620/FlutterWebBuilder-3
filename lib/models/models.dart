class User {
  final int id;
  final String name;
  final String phone;
  final String email;
  final String token;

  User({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'email': email,
      'token': token,
    };
  }
}

class UserRegistration {
  final String name;
  final String phone;
  final String email;
  final String password;

  UserRegistration({
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
  });
}

class Category {
  final int id;
  final String name;
  final String image;
  final String description;

  Category({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      description: json['description'] ?? '',
    );
  }
}

class Service {
  final int id;
  final String name;
  final String image;
  final String description;
  final double price;
  final int categoryId;

  Service({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.price,
    required this.categoryId,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      id: json['id'],
      name: json['name'] ?? '',
      image: json['image'] ?? '',
      description: json['description'] ?? '',
      price: double.tryParse(json['price'].toString()) ?? 0.0,
      categoryId: json['category_id'] ?? 0,
    );
  }
}

class ApiResponse<T> {
  final String status;
  final String message;
  final T? data;

  ApiResponse({
    required this.status,
    required this.message,
    this.data,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json, T? Function(dynamic)? fromJson) {
    return ApiResponse(
      status: json['status'] ?? 'error',
      message: json['message'] ?? 'حدث خطأ غير معروف',
      data: json['data'] != null && fromJson != null ? fromJson(json['data']) : null,
    );
  }
}