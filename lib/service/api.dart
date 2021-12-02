import 'package:ohm_card/models/models.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Api {
  final String _baseUrl = "http://localhost:3000/";
  Future<LoginResponseModel> loginUser(
      LoginRequestModel loginResponseModel) async {
    var _url = Uri.parse("${_baseUrl}login");

    final _response = await http.post(
      _url,
      headers: <String, String>{
        "Access-Control-Allow-Origin": "*",
      },
      body: loginResponseModel.toJson(),
    );

    print('Response status: ${_response.statusCode}');
    print('Response body: ${_response.body}');

    if (_response.statusCode == 201 || _response.statusCode == 200) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      bool result = await prefs.setString("user", _response.body);
      print(result);

      return LoginResponseModel.fromJson(jsonDecode(_response.body));
    } else {
      throw Exception('Failed to create user.');
    }
  }

//Get request um Userdaten über Server aus studierenden_db zu ziehen
  // Future<User> getUserDetails(String token) async {
  //   var _url = Uri.parse("${_baseUrl}home");

  //   final _response = await http.get(
  //     _url,
  //     headers: <String, String>{
  //       HttpHeaders.contentTypeHeader: "application/json",
  //       HttpHeaders.authorizationHeader: "Bearer $token",
  //     },
  //   );
  //   print("Token: $token");
  //   print(_response);

  //   return User.fromJson(jsonDecode(_response.body));
  // }
}
