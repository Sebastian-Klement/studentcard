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
