import 'package:equatable/equatable.dart';

enum LoginStatus {LOADING,INPROGRESS, SUCCESS, FAILURE }
class LoginState extends Equatable {
  final String email;
  final String password;
  final String message;
  final LoginStatus  loginStatus ;
  LoginState(
      {
        this.email = "",
        this.password = "",
        this.message = "",
        this.loginStatus = LoginStatus.INPROGRESS
      });

  @override
  List<Object?> get props => [email,password,message,loginStatus];

  LoginState copyWith(
      {String? email,
        String? password,
        String? message,
        LoginStatus? loginStatus}) {
    return LoginState(
        email: email??this.email,
        password: password??this.password,
        message: message??this.message,
        loginStatus: loginStatus??this.loginStatus
    );
  }


}