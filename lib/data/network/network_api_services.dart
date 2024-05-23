
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bloc_clean_arch/data/exceptions/app_exceptions.dart';
import 'package:bloc_clean_arch/data/network/basic_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkAPIServices implements BasicAPIServices {
  @override
  Future<dynamic> getAPIService(String url) async {
    dynamic responseData;
    try {
      var response = await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));

      responseData = returnResponse(response);

    } on SocketException {
      throw NoInternetException('error');
    } on TimeoutException {
      throw FetchDataException('Timeout, try again');
    }

    return responseData;
  }

  @override
  Future<dynamic> postAPIService(String url, dynamic data) async {
    dynamic responseData;
    print(url);
    print(data);
    try {
      var headers = {
        'Content-Type': 'application/json'
      };
      var response = await http.post(Uri.parse(url),body:jsonEncode(data),headers: headers).timeout(const Duration(seconds: 10));
      print(response.statusCode);
        print("response=" + response.body);
      responseData = returnResponse(response);

    } on SocketException {
      throw NoInternetException('error');
    } on TimeoutException {
      throw FetchDataException('Timeout, try again');
    }
    print(responseData.toString());
    return responseData;
  }


  dynamic returnResponse(http.Response response) {
    dynamic jsonResponse;
    switch(response.statusCode){
      case 200:
          jsonResponse = jsonDecode(response.body);
          return jsonResponse;
      case 400:
        jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 500:
        throw InternalServerException(response.reasonPhrase);

    }
    return jsonResponse;
  }
}