class User {
  final String username;
  final String userpassword;

  User({required this.username, required this.userpassword});

// create the user object from server response server -> client
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      userpassword: json['email'],
    );
  }
  // exports to json
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['email'] = this.userpassword;
    return data;
  }
}

// class LoginResponseModel {
//   late String username;
//   late String userpassword;
//   late String email;
//   LoginResponseModel(
//       {required this.username,
//       required this.userpassword,
//       required this.email});

//   factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
//     return LoginResponseModel(
//       username: json["username"],
//       userpassword: json["userpassword"],
//       email: json["email"],
//     );
//   }
// }

// class LoginRequestModel {
//   late String username;
//   late String userpassword;
//   LoginRequestModel({required this.username, required this.userpassword});

//   // exports to json: client -> server
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = {
//       'username': username.trim(),
//       'userpassword': userpassword.trim(),
//     };
//     return data;
//   }
//}
