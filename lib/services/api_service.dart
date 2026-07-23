import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "http://10.209.31.160:5501"; // <-- YOUR IP HERE

  // Notify Route
  static Future<String?> notifyUser(String name, String email) async {
    final url = Uri.parse("$baseUrl/notify");

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"name": name, "email": email}),
    );

    final json = jsonDecode(response.body);

    return json["message"]; // returns success message
  }

  // Contact Route
  static Future<String?> contactSupport(String name, String email, String message) async {
    final url = Uri.parse("$baseUrl/api/contact");

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"name": name, "email": email, "message": message}),
    );

    final json = jsonDecode(response.body);

    return json["message"];
  }
}
