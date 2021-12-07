import 'package:shared_preferences/shared_preferences.dart';
import 'package:ohm_card/models/models.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Api {
  final String _baseUrl = "http://192.168.178.21:3000/";
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
      throw Exception("Failed to create user.");
    }
  }

//Get request um Userdaten über Server aus studierenden_db zu ziehen
  Future<bool> getUserContent(String token) async {
    bool isUserContent = false;

    var _url = Uri.parse("${_baseUrl}home");

    final _response = await http.get(
      _url,
      headers: {
        // 'Content-Type': 'application/json',
        // 'Accept': 'application/json',
        // 'Authorization': 'Bearer $token',
        // 'Content-Type': 'application/json',
        // 'Accept': 'application/json',
        // 'Authorization': 'Basic $token',
        //HttpHeaders.authorizationHeader: "Basic $token",
        //HttpHeaders.contentTypeHeader: "application/json",
        //"Authorization": "Bearer $token",
        "x-access-token": "$token"
      },
    );
    print("Token: " + token);
    print("Response: ${_response.body}");

    if (_response.statusCode == 202) {
      isUserContent = true;
    } else {
      throw Exception("Faild to auth token");
    }
    return isUserContent;
  }
}
