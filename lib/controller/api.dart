import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:ohm_card/models/models.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Api {
  final String _baseUrl = "http://141.75.225.18:3000/";
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
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: "Basic $token",
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

  Future<Medium> getMedium(String libraryId) async {
    var _url = Uri.parse("${_baseUrl}allmedium");

    final _response = await http.post(
      _url,
      headers: <String, String>{
        "Access-Control-Allow-Origin": "*",
      },
      body: jsonEncode(<String, String>{
        'libraryId': libraryId,
      }),
    );

    if (_response.statusCode == 201 || _response.statusCode == 200) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("medium", _response.body);

      return Medium.fromJson(jsonDecode(_response.body));
    } else {
      throw Exception("Failed to create user.");
    }
  }
}
