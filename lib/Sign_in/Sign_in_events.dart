abstract  class SignInEvents{}

class SignInTextChangedEvent extends SignInEvents{
  String EmailValue;
  String PasswordValue;
  SignInTextChangedEvent(this.EmailValue,this.PasswordValue);
}


class SignInSubmittedEvent extends SignInEvents{
  String Email;
  String Password;
  SignInSubmittedEvent(this.Email,this.Password);
}