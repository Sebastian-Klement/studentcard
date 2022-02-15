class User {
  final String studentId;
  final String username;
  final String token;
  final String email;
  final String firstname;
  final String surname;
  final String birthday;
  final String libraryId;

  User(
    this.studentId,
    this.username,
    this.token,
    this.email,
    this.firstname,
    this.surname,
    this.birthday,
    this.libraryId,
  );

  User.fromJson(Map<String, dynamic> json)
      : studentId = json["studentId"],
        username = json["username"],
        token = json["token"],
        email = json["email"],
        firstname = json["firstname"],
        surname = json["surname"],
        birthday = json["birthday"],
        libraryId = json["libraryId"];
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

  LoginResponseModel(
    this.studentId,
    this.username,
    this.email,
    this.firstname,
    this.surname,
    this.birthday,
    this.libraryId,
    this.token,
  );

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

class Medium {
  int? mediumId;
  String? title;
  String? author;
  String? isbn;
  String? timeStamp;
  Medium({this.mediumId, this.title, this.author, this.isbn, this.timeStamp});

  factory Medium.fromJson(Map<String, dynamic> json) => Medium(
      mediumId: json['mediumId'],
      title: json['title'],
      author: json['author'],
      isbn: json['isbn'],
      timeStamp: json['timeStamp']);

  Map<String, dynamic> toJson() => {
        'mediumId': mediumId,
        'title': title,
        'author': author,
        'isbn': isbn,
        'timeStamp': timeStamp
      };
}
