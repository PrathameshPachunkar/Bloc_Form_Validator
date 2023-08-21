

import 'dart:math';

import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login_bloc/Sign_in/SignInState.dart';
import 'package:flutter_login_bloc/Sign_in/Sign_in_events.dart';

class SignIn_bloc extends Bloc<SignInEvents,SignInState>{
  SignIn_bloc():super(SignInInitalState()){
    on<SignInTextChangedEvent>((event, emit) => {
     if(EmailValidator.validate(event.EmailValue)==false){
       emit(SignInErrorState("Enter a valid Email Address"))
     }
     else if(event.PasswordValue.length<8){
       emit(SignInErrorState("Enter a valid Password"))
     }
     else {
       emit(SignInValidState())
       }
    }



    );
    on<SignInSubmittedEvent>((event, emit) => emit(SignInLoadingState()),);
  }
}