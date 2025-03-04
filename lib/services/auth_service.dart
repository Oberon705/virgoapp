import 'dart:convert';
import 'package:http/http.dart' as http;
//import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final String apiUrl = 'https://localhost:7221/api/auth/login';

  Future<dynamic> login(String username, String password) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          "username": "imadmin",
          "password": "Pass@1234",
        }),
      );

      if (response.statusCode == 200) {
        // Parse the response to get the JWT token
        dynamic data = json.decode(response.body);
        print(" resp : ${data}");
        String token = data['Token'];

        // Store the token locally using SharedPreferences
        //SharedPreferences prefs = await SharedPreferences.getInstance();
        //await prefs.setString('jwt_token', token);

        return data; //response.body.toString();
      } else {
        return "";
      }
    } catch (e) {
      print("Error: $e");
      return "";
    }
  }

  Future<String?> getToken() async {
    //SharedPreferences prefs = await SharedPreferences.getInstance();
    //return prefs.getString('jwt_token');
    return "";
  }

  Future<dynamic> fetchData() async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode({
          "username": "imadmin",
          "password": "Pass@1234",
        }),
      );
      // Simulating a network delay of 2 seconds
      //await Future.delayed(Duration(seconds: 2));

      // Returning data once the "network request" is completed
      //return "Fetched Data Successfully!";
      if (response.statusCode == 200) {
        dynamic data = json.decode(response.body);
        return data;
      }
      return response;
    } catch (e) {
      print("Error: $e");
      return "Error";
    }
  }
}
