// User model
class User {
  final String id;
  final String name;
  final String email;
  final String token;
  final String? phoneNumber;
  final String? profileImage;
  final String? address;
  
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.token,
    this.phoneNumber,
    this.profileImage,
    this.address,
  });
  
  // Create from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'].toString(),
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      token: json['token'] ?? '',
      phoneNumber: json['phone_number'],
      profileImage: json['profile_image'],
      address: json['address'],
    );
  }
  
  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'token': token,
      'phone_number': phoneNumber,
      'profile_image': profileImage,
      'address': address,
    };
  }
  
  // Create a copy with updated fields
  User copyWith({
    String? name,
    String? email,
    String? phoneNumber,
    String? profileImage,
    String? address,
  }) {
    return User(
      id: this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      token: this.token,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profileImage: profileImage ?? this.profileImage,
      address: address ?? this.address,
    );
  }
}

// Category model
class Category {
  final String id;
  final String name;
  final String? description;
  final String? imageUrl;
  
  Category({
    required this.id,
    required this.name,
    this.description,
    this.imageUrl,
  });
  
  // Create from JSON
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'].toString(),
      name: json['name'] ?? '',
      description: json['description'],
      imageUrl: json['image_url'],
    );
  }
  
  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'image_url': imageUrl,
    };
  }
}

// Service model
class Service {
  final String id;
  final String name;
  final String description;
  final double price;
  final String categoryId;
  final String? imageUrl;
  final String? providerId;
  final String? providerName;
  final double? rating;
  final bool? isFeatured;
  
  Service({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.categoryId,
    this.imageUrl,
    this.providerId,
    this.providerName,
    this.rating,
    this.isFeatured,
  });
  
  // Create from JSON
  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      id: json['id'].toString(),
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      price: (json['price'] != null) ? double.parse(json['price'].toString()) : 0.0,
      categoryId: json['category_id'].toString(),
      imageUrl: json['image_url'],
      providerId: json['provider_id']?.toString(),
      providerName: json['provider_name'],
      rating: json['rating'] != null ? double.parse(json['rating'].toString()) : null,
      isFeatured: json['is_featured'] == '1' || json['is_featured'] == true,
    );
  }
  
  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'category_id': categoryId,
      'image_url': imageUrl,
      'provider_id': providerId,
      'provider_name': providerName,
      'rating': rating,
      'is_featured': isFeatured,
    };
  }
}

// Booking model
class Booking {
  final String id;
  final String userId;
  final String serviceId;
  final String serviceName;
  final String status;
  final DateTime bookingDate;
  final String? notes;
  final double? amount;
  
  Booking({
    required this.id,
    required this.userId,
    required this.serviceId,
    required this.serviceName,
    required this.status,
    required this.bookingDate,
    this.notes,
    this.amount,
  });
  
  // Create from JSON
  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      id: json['id'].toString(),
      userId: json['user_id'].toString(),
      serviceId: json['service_id'].toString(),
      serviceName: json['service_name'] ?? '',
      status: json['status'] ?? 'pending',
      bookingDate: json['booking_date'] != null 
          ? DateTime.parse(json['booking_date']) 
          : DateTime.now(),
      notes: json['notes'],
      amount: json['amount'] != null ? double.parse(json['amount'].toString()) : null,
    );
  }
  
  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'service_id': serviceId,
      'service_name': serviceName,
      'status': status,
      'booking_date': bookingDate.toIso8601String(),
      'notes': notes,
      'amount': amount,
    };
  }
}