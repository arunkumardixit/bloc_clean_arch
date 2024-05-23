
import 'dart:async';

import 'package:bloc_clean_arch/config/routes/route_name.dart';
import 'package:flutter/cupertino.dart';

class SplashServices{

  void isLogin(BuildContext context){
    Timer(Duration(seconds: 3),()=>
    Navigator.pushNamedAndRemoveUntil(context, RouteName.route_loginscreen , (route) => false));
  }
}