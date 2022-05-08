// To parse this JSON data, do
//
//     final User = UserFromJson(jsonString);

import 'dart:convert';

import 'dart:io';

// To parse this JSON data, do
//
//     final userLogin = userLoginFromJson(jsonString);

import 'dart:convert';


// To parse this JSON data, do
//
//     final userCredential = userCredentialFromJson(jsonString);

import 'dart:convert';

UserCredential userCredentialFromJson(String str) => UserCredential.fromJson(json.decode(str));

String userCredentialToJson(UserCredential data) => json.encode(data.toJson());

class UserCredential {
  UserCredential({
    this.username,
    this.password,
  });

  String? username;
  String? password;

  factory UserCredential.fromJson(Map<String, dynamic> json) => UserCredential(
    username: json["username"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "password": password,
  };
}








// To parse this JSON data, do
//
//     final accessToken = accessTokenFromJson(jsonString);

AccessToken accessTokenFromJson(String str) => AccessToken.fromJson(json.decode(str));

String accessTokenToJson(AccessToken data) => json.encode(data.toJson());

class AccessToken {
  AccessToken({
    this.refresh,
    this.access,
  });

  String? refresh;
  String? access;

  factory AccessToken.fromJson(Map<String, dynamic> json) => AccessToken(
    refresh: json["refresh"],
    access: json["access"],
  );

  Map<String, dynamic> toJson() => {
    "refresh": refresh,
    "access": access,
  };
}











User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.username,
    this.password,
    this.email,
    this.firstName,
    this.lastName,
    this.image
  });

  String? username;
  String? password;
  String? email;
  String? firstName;
  String? lastName;
  File? image;

  factory User.fromJson(Map<String, dynamic> json) => User(
    username: json["username"],
    password: json["password"],
    email: json["email"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "password": password,
    "email": email,
    "first_name": firstName,
    "last_name": lastName,
    "image":image,
  };
}
