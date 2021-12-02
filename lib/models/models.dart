class User {
  final String studentId;
  final String username;
  final String token;
  final String email;
  final String firstname;
  final String surname;
  final String birthday;
  final String libraryId;
//  final String error;
  User(
    this.studentId,
    this.username,
    this.token,
    this.email,
    this.firstname,
    this.surname,
    this.birthday,
    this.libraryId,
    // this.error,
  );
//studentId":1111111,"username":"test12345","userpassword":"123","accesstoken":"123456789","email":"test@mordor.al",
//"firstname":"vtest","surname":"ntest","birthday":"2980-04-06","libraryId":"11111111111"
  User.fromJson(Map<String, dynamic> json)
      : studentId = json["studentId"],
        username = json["username"],
        token = json["token"],
        email = json["email"],
        firstname = json["firstname"],
        surname = json["surname"],
        birthday = json["birthday"],
        libraryId = json["libraryId"];
  //error: json["error"],

}

class LoginRequestModel {
  late String username;
  late String userpassword;

  LoginRequestModel(
    String username,
    String userpassword,
  ) {
    this.username = username;
    this.userpassword = userpassword;
  }
  // exports to json
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["username"] = this.username;
    data["userpassword"] = this.userpassword;
    return data;
  }
}

class LoginResponseModel {
  final int studentId;
  final String username;
  final String token;
  final String email;
  final String firstname;
  final String surname;
  final String birthday;
  final String libraryId;
  //late String error;

  LoginResponseModel(
    this.studentId,
    this.username,
    this.email,
    this.firstname,
    this.surname,
    this.birthday,
    this.libraryId,
    //required this.error,
    this.token,
  );
//studentId":1111111,"username":"test12345","userpassword":"123","accesstoken":"123456789","email":"test@mordor.al",
//"firstname":"vtest","surname":"ntest","birthday":"2980-04-06","libraryId":"11111111111"
  LoginResponseModel.fromJson(Map<String, dynamic> json)
      : studentId = json["studentId"],
        username = json["username"],
        token = json["token"],
        email = json["email"],
        firstname = json["firstname"],
        surname = json["surname"],
        birthday = json["birthday"],
        libraryId = json["libraryId"];
}
