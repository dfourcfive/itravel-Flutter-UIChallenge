import 'dart:io';

class UserLogin {
  String username;
  String password;

  UserLogin({this.username, this.password});

  Map<String, dynamic> toDatabaseJson() =>
      {"email": this.username, "password": this.password};
}

class Token {
  String token;

  Token({this.token});

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(token: json['token']);
  }
}

class UserSignUp {
  String fullName;
  String email;
  String password;
  File profilepicture;

  UserSignUp({this.fullName, this.email, this.password, this.profilepicture});

  Map<String, dynamic> toDatabaseJson() => {
        "fullName": this.fullName,
        "email": this.email,
        "password": this.password,
        "ProfilePicture": this.profilepicture
      };
}
