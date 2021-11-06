
import 'dart:async';
import 'dart:async';
import 'dart:async';
import 'dart:async';
import 'dart:convert';
import 'dart:core';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:news_app/domain/user.dart';
import 'package:news_app/utility/app_url.dart';
import 'package:news_app/utility/shared_prefrence.dart';

enum Status{
  NotLoggedIn,
  NotRegistered,
  LoggedIn,
  Registered,
  Authenticating,
  Registering,
  LoggedOut
}

class AuthProvider extends ChangeNotifier{
  Status _loggedInStatus  = Status.NotLoggedIn;
  Status _registeredInStatus = Status.NotRegistered;

  Status get loggedInStatus => _loggedInStatus;

  set loggedInStatus(Status value) {
    _loggedInStatus = value;
  }

  Status get registeredInStatus => _registeredInStatus;

  set registeredInStatus(Status value) {
    _registeredInStatus = value;
  }


  /*Future <Map<String,dynamic>>(String email,String password) async {
    final apiBodyData ={
      'email': email,
      'password': password,
    } as Map;

    return await post (AppUrl.register,
  body: json.encode(apiBodyData),
  headers: {'Content-Type': 'application/json'}
  ).then(OnValue).catchError(onError);

  }*/
static Future<FutureOr>(Response response) async{
    var result ;

    final Map<String,dynamic> responseData = json.decode(response.body);
    print(responseData);
    if(response.statusCode == 200){

      var userData = responseData ['date'];

      //creating user model
      User authUser = User.fromJson(responseData);

      //creating shared preference and save data
      UserPreferences().saveUser(authUser);

      result = {
      'status':true,
      'message':'Successfully registered',
      'data':authUser
    };

    }else
      {
        result = {
        'status':false,
        'message':'Successfully registered',
        'data':responseData
        };
      }
return result;




}
static onError(error){
  print('the error is ${error.detail}');
  return {
    'status':false,
    'message':'Unsuccessful Request',
    'data':error
  };
}

}

