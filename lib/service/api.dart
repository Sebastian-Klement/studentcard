import 'package:ohm_card/models/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

String _baseUrl = "http://localhost:3000/";

Future<User> loginUser(String username, String userpassword) async {
  print(username);
  print(userpassword);
  print("try the post");
  var _url = Uri.parse("${_baseUrl}login");
  final _response = await http.post(
    _url,
    headers: <String, String>{
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json; charset=UTF-8",
    },
    body: jsonEncode(
      <String, String>{
        "username": username,
        "userpassword": userpassword,
      },
    ),
    // //loginRequestModel.toJson(),
  );

  print('Response status: ${_response.statusCode}');
  print('Response body: ${_response.body}');

  if (_response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return User.fromJson(jsonDecode(_response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create user.');
  }

  //   switch (_response.statusCode) {
  //     case 200:
  //       return User.fromJson(jsonDecode(_response.body));
  //     //break;
  //     case 401:
  //       print(ApiError.fromJson(json.decode(_response.body)));
  //       break;
  //     default:
  //       print(ApiError.fromJson(json.decode(_response.body)));
  //       break;
  //   }
  // } on SocketException {
  //   print(ApiError(error: "Server error. Please retry"));
  // }
  // return _apiResponse;
}

//Get request um Userdaten über Server aus studierenden_db zu ziehen
// Future<ApiResponse> getUserDetails(String username) async {
//   ApiResponse _apiResponse = new ApiResponse();
//   try {
//     final response = await http.get(Uri.parse("${_baseUrl}user/$username"));
//     print(response.body);
//     switch (response.statusCode) {
//       case 200:
//         _apiResponse.data = User.fromJson(json.decode(response.body));
//         break;
//       case 401:
//         print((_apiResponse.apiError as ApiError));
//         _apiResponse.apiError = ApiError.fromJson(json.decode(response.body));
//         break;
//       default:
//         print((_apiResponse.apiError as ApiError));
//         _apiResponse.apiError = ApiError.fromJson(json.decode(response.body));
//         break;
//     }
//   } on SocketException {
//     _apiResponse.apiError = ApiError(error: "Server error. Please retry");
//   }
//   return _apiResponse;
// }
