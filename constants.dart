// API Constants
class ApiConstants {
  // Base URL for the API
  static const String baseUrl = 'https://yemenmazady.com/api/';
  
  // API Key for authentication
  static const String apiKey = '9fedcbced6b38503dcae6c8e1f766a2d';
  
  // API Endpoints
  static const String loginEndpoint = 'login_user.php';
  static const String registerEndpoint = 'register_user.php';
  static const String getCategoriesEndpoint = 'get_categories.php';
  static const String getServicesEndpoint = 'get_services.php';
  static const String getServiceDetailsEndpoint = 'get_service_details.php';
  static const String getUserProfileEndpoint = 'get_user_profile.php';
  static const String updateUserProfileEndpoint = 'update_user_profile.php';
  static const String createBookingEndpoint = 'create_booking.php';
  static const String getUserBookingsEndpoint = 'get_user_bookings.php';
}

// App Constants
class AppConstants {
  // App Name
  static const String appName = 'Yemen Mazady';
  
  // Storage Keys
  static const String userTokenKey = 'user_token';
  static const String userDataKey = 'user_data';
  
  // Default Values
  static const int defaultPageSize = 10;
  
  // Timeout Durations
  static const int connectionTimeout = 30; // seconds
}

// UI Constants
class UIConstants {
  // Colors (as hex strings, to be converted to Color objects in Flutter)
  static const String primaryColor = '#0175C2'; // Flutter Blue
  static const String secondaryColor = '#02569B'; // Darker Blue
  static const String accentColor = '#FFC107'; // Amber
  static const String backgroundColor = '#F5F5F5'; // Light Grey
  static const String textColor = '#333333'; // Dark Grey
  static const String errorColor = '#D32F2F'; // Red
  
  // Text Sizes
  static const double headingSize = 24.0;
  static const double subheadingSize = 18.0;
  static const double bodyTextSize = 14.0;
  static const double smallTextSize = 12.0;
  
  // Padding and Margins
  static const double defaultPadding = 16.0;
  static const double smallPadding = 8.0;
  static const double largePadding = 24.0;
  
  // Border Radius
  static const double borderRadius = 8.0;
  static const double buttonRadius = 4.0;
}