import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/user_model.dart';
import '../util/global_variable.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserApi {

  //  static Future<User> getUser() async {
  //   final response = await http.get(Uri.parse("${Env.URL_PREFIX}/auth/users/"));
  //
  //   if (response.statusCode == 200) {
  //
  //     return  userFromJson(response.body);
  //   }
  //   throw Exception('failed to load user data');
  // }

  static Future<void> login(UserCredential userCredential,BuildContext context)async{

    final response = await http.post(Uri.parse("${Env.URL_PREFIX}/auth/jwt/create/"),
                                      headers:{"Content-Type":'application/json'} ,
                                      body:userCredentialToJson(userCredential) );
    print("${response.statusCode}: ${response.body}");
    if(response.statusCode < 300 && response.statusCode >= 200){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('you are log in'),), );

      AccessToken at= accessTokenFromJson(response.body);

      var tokenPref = await SharedPreferences.getInstance();
      tokenPref.setString("access", at.access.toString());
      tokenPref.setString("refresh", at.refresh.toString());
      return ;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('log in is failed'),), );
    throw Exception("creating account is failed");
  }

  static Future<void> createAccount(User user,BuildContext context) async{

     final response = await http.post(Uri.parse("${Env.URL_PREFIX}/auth/users/"),
                                       headers:{"Content-Type":'application/json',} ,
                                       body: userToJson(user));
      print("${response.statusCode}: ${response.body}");
     if(response.statusCode < 300 && response.statusCode>=200){
       ScaffoldMessenger.of(context).showSnackBar(
         const SnackBar(content: Text('Account is created'),), );
       return;
     }
     ScaffoldMessenger.of(context).showSnackBar(
       const SnackBar(content: Text('creating account is failed'),), );
     throw Exception("creating account is failed");
  }


}