
import 'package:flutter/cupertino.dart';

class AppExceptions implements Exception{
  final _message;
  final _prefix;

  AppExceptions([this._message,this._prefix]);

  @override
  String toString() {
    // TODO: implement toString
    return '$_message $_prefix';
  }
}

class NoInternetException extends AppExceptions {
  NoInternetException([String? message]):super(message,"No Internet Connection");
}

class UnAuthorizedException extends AppExceptions {
  UnAuthorizedException([String? message]):super(message,"UnAuthorized Connection");
}


class InternalServerException extends AppExceptions {
  InternalServerException([String? message]):super(message,"Not available");
}


class FetchDataException extends AppExceptions {
  FetchDataException([String? message]):super(message," Timeout Exception");
}