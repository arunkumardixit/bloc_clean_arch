import 'package:bloc_clean_arch/blocs/Login_Bloc/login_bloc.dart';
import 'package:bloc_clean_arch/blocs/Login_Bloc/login_event.dart';
import 'package:bloc_clean_arch/config/utils.dart';
import 'package:bloc_clean_arch/models/user/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/Login_Bloc/login_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  final _formKey = GlobalKey<FormState>();
  late LoginBloc _loginBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loginBloc = LoginBloc();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => _loginBloc,
  child: Scaffold(appBar: AppBar(title: Text("Login"),),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BlocBuilder<LoginBloc, LoginState>(
                builder: (context, state) {
                return TextFormField(
                  focusNode: emailFocusNode,
                  decoration: InputDecoration(
                      hintText: 'Enter email', border: OutlineInputBorder()),
                  onChanged: (value) {
                    context.read<LoginBloc>().add( EmailChangedEvent(email: value));
                  },
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Enter Email';
                    }
                    return null;
                  },
                  onFieldSubmitted: (value) {},
                );
              },
            ),
            SizedBox(height: 10,),
            BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                return TextFormField(
                  obscureText: true,
                  focusNode: passwordFocusNode,
                  decoration: InputDecoration(
                      hintText: 'Enter password', border: OutlineInputBorder()),
                  onChanged: (value) {
                    context.read<LoginBloc>().add(PasswordChangedEvent(password: value));
                  },
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Enter Password';
                    }
                    return null;
                  },
                  onFieldSubmitted: (value) {},
                );
              },
            ), 
            SizedBox(height: 10,),
            BlocListener<LoginBloc, LoginState>(
              listenWhen: (previous, current) => previous.loginStatus != current.loginStatus,
              listener: (context, state) {
                if(state.loginStatus == LoginStatus.FAILURE) {
                  Utils.showSnackBar(context, "login failure. " + state.message);
                }
                if(state.loginStatus == LoginStatus.SUCCESS) {
                  Utils.showSnackBar(context, "login success "+ state.message);
                }
              },
              child: BlocBuilder<LoginBloc, LoginState>(
                buildWhen: (current, previous) => current.loginStatus != previous.loginStatus,
                builder: (context, state) {
                  if(state.loginStatus == LoginStatus.LOADING){
                    return ElevatedButton(onPressed: null
                    , child: CircularProgressIndicator());
                  }
                  return ElevatedButton(onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      context.read<LoginBloc>().add(
                          const CallLoginAPIEvent());
                    }
                  }, child: Text("Login"));
                },
              ),
            )
          ],),
      ),
    ),
);
  }
}
