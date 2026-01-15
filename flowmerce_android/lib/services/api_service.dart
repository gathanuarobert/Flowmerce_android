import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "http://10.0.2.2:8000/api/",
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    ),
  )..interceptors.add(_authInterceptor());

  // =======================
  // Interceptor (like Axios)
  // =======================
  static InterceptorsWrapper _authInterceptor() {
    return InterceptorsWrapper(
      onRequest: (options, handler) async {
        final prefs = await SharedPreferences.getInstance();
        final token = prefs.getString("access_token");

        if (token != null) {
          options.headers["Authorization"] = "Bearer $token";
        }

        return handler.next(options);
      },
      onError: (DioException error, handler) async {
        final statusCode = error.response?.statusCode;

        if (statusCode == 401) {
          await _handleLogout();
        } else {
          _handleError(error);
        }

        return handler.next(error);
      },
    );
  }

  // =======================
  // API Calls
  // =======================
  static Future<List<dynamic>> fetchProducts() async {
    final response = await _dio.get("/products/");
    return response.data;
  }

  // =======================
  // Error Handling
  // =======================
  static void _handleError(DioException error) {
    if (error.response == null) {
      Fluttertoast.showToast(msg: "Network error - check connection");
      return;
    }

    final data = error.response?.data;
    final message =
        data?["error"] ??
        data?["detail"] ??
        data?["message"] ??
        "An error occurred";

    Fluttertoast.showToast(msg: message);
  }

  // =======================
  // Logout
  // =======================
  static Future<void> _handleLogout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("access_token");
    await prefs.remove("refresh_token");

    Fluttertoast.showToast(msg: "Session expired. Please log in again");
    // Navigation handled in UI layer
  }
}
