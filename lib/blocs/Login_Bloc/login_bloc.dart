
import 'package:bloc_clean_arch/Repositories/login_repositories.dart';
import 'package:bloc_clean_arch/blocs/Login_Bloc/login_event.dart';
import 'package:bloc_clean_arch/blocs/Login_Bloc/login_state.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_clean_arch/config/AppUrls.dart';
import 'package:bloc_clean_arch/models/user/user_model.dart';

class LoginBloc extends Bloc<LoginEvent,LoginState> {
  LoginRepository repository = LoginRepository();

  LoginBloc():super(LoginState()){
    on<EmailChangedEvent>(_emailChanged);
    on<PasswordChangedEvent>(_passwordChanged);
    on<CallLoginAPIEvent>(_callLoginAPI);

  }

  void _emailChanged (EmailChangedEvent event , Emitter<LoginState> emit) {
    emit(state.copyWith(email:event.email));
    print("e="+ state.email);
  }
  void _passwordChanged (PasswordChangedEvent event , Emitter<LoginState> emit) {
    emit(state.copyWith(password:event.password));
    print("pass="+ state.password);
  }

  Future<void> _callLoginAPI (CallLoginAPIEvent event , Emitter<LoginState> emit) async {
    print("_callLoginAPI b");
    emit(state.copyWith(loginStatus: LoginStatus.LOADING));
    print("_callLoginAPI");
    try{
      var value = await repository.login(state.email,state.password);
      print("_callLoginAPI repository.login done");
      if(value.error.toString().isNotEmpty){
        emit(state.copyWith(loginStatus: LoginStatus.FAILURE,message: value.error));
      }else {
        emit(state.copyWith(loginStatus: LoginStatus.SUCCESS,message: value.token));
      }

      print("_callLoginAPI  success");
    } catch(err){
      emit(state.copyWith(loginStatus: LoginStatus.FAILURE,message: err.toString()));
      print("_callLoginAPI  error" + err.toString());
    }



  }
}