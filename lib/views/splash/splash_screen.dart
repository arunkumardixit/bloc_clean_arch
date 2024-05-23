import 'package:bloc_clean_arch/config/component/internet_exception_widget.dart';
import 'package:bloc_clean_arch/config/routes/route_name.dart';
import 'package:bloc_clean_arch/services/splash/splash_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/exceptions/app_exceptions.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices _splashServices = SplashServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _splashServices.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Splash"),),
    body:  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
      Text("Splash",style: TextStyle(fontSize: 28),)
      ],),
    );
  }
}
