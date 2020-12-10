import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:itravel/models/UserLogin.dart';

final _base = "https://home-itravel-app.herokuapp.com";
final _tokenEndpoint = "/api-token-auth/";
final _tokenURL = _base + _tokenEndpoint;

Future<Token> attemptLogin(UserLogin userLogin) async {
  print(_tokenURL);
  final http.Response response = await http.post(
    _tokenURL,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(userLogin.toDatabaseJson()),
  );
  if (response.statusCode == 200) {
    return Token.fromJson(json.decode(response.body));
  } else {
    print(json.decode(response.body).toString());
    throw Exception(json.decode(response.body));
  }
}

Future<dynamic> attemptSignUp(UserSignUp userSignUp) async {
  Dio dio = new Dio();

  final _tokenSignUpEndpoint = "/api-token-SignUp/";
  print(_tokenURL);

  dio.options.headers["Content-Type"] = "multipart/form-data";
  FormData formData = new FormData.fromMap({
    "email": userSignUp.email,
    "password": userSignUp.password,
    "ProfilePicture": await MultipartFile.fromFile(
        userSignUp.profilepicture.path,
        filename: userSignUp.email + "jpg")
  });

  final response = await dio.post(_base + _tokenSignUpEndpoint, data: formData);
  if (response.statusCode == 200) {
    return json.decode(response.data);
  } else {
    print(json.decode(response.data).toString());
    throw Exception(json.decode(response.data));
  }
}
