abstract class SignInState{}

class SignInInitalState extends SignInState{}

class SignInValidState extends SignInState{}

class SignInErrorState extends SignInState{
String errormessage;
SignInErrorState(this.errormessage);
}

class SignInLoadingState extends SignInState{}

