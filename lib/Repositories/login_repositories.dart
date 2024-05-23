import 'dart:convert';

import 'package:bloc_clean_arch/data/network/basic_api_services.dart';
import 'package:bloc_clean_arch/data/network/network_api_services.dart';
import 'package:bloc_clean_arch/models/user/user_model.dart';
import 'package:equatable/equatable.dart';
import '../config/AppUrls.dart';

class LoginRepository extends Equatable {
  @override
  List<Object?> get props => [_basicAPIServices];
  
  BasicAPIServices _basicAPIServices = NetworkAPIServices();

  
  Future<dynamic>login(String email,String password) async {
    Map data = {"email":email,"password":password};
    var jsonResponse = await _basicAPIServices.postAPIService(AppUrls.loginUrl, data);

    return UserModel.fromJson(jsonResponse);
  }
  
}