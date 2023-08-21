import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login_bloc/Sign_in/SignInState.dart';
import 'package:flutter_login_bloc/Sign_in/Sign_in_events.dart';
import 'package:flutter_login_bloc/Sign_in/SingIn_bloc.dart';


class Sign_in_page extends StatelessWidget {
  const Sign_in_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     TextEditingController EmailController = TextEditingController();
      TextEditingController PasswordController = TextEditingController();
    return Scaffold(
      body:  SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 20
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                BlocBuilder<SignIn_bloc,SignInState>(builder: (context,state){
                  if(state is SignInErrorState){
                    return Text(state.errormessage,
                    style: TextStyle(color: Colors.red),
                    );
                  }
                  else {
                    return Container();
                  }
                }),
                BlocBuilder<SignIn_bloc,SignInState>(
                  builder: (context,state) {
                    return TextField(

                      decoration: const InputDecoration(

                        hintText: "Email",
                      ),
                      controller: EmailController,

                      onChanged: (val){
                        BlocProvider.of<SignIn_bloc>(context).add
                          (SignInTextChangedEvent(EmailController.text,
                            PasswordController.text));
                      },

                    );
                  }
                ),
                TextField(

                  decoration: const InputDecoration(

                    hintText: "Password",
                  ),
                  controller: PasswordController,

                  onChanged: (val){
                    BlocProvider.of<SignIn_bloc>(context).add
                      (SignInTextChangedEvent(EmailController.text,
                        PasswordController.text));


                  },

                ),
                BlocBuilder<SignIn_bloc,SignInState>(
                  builder: (context,state) {

                    if(state is SignInLoadingState){
                      return CircularProgressIndicator();
                    }
                    return CupertinoButton(
                        color: (state is SignInValidState)?Colors.blueAccent:Colors.grey,
                        child: const Text("Sign In"), onPressed: (){
                          BlocProvider.of<SignIn_bloc>(context).add
                            (SignInSubmittedEvent(EmailController.text,
                            PasswordController.text));
                    },
                        );
                  }
                )
              ],
            ),
          )
        ),
      ),
    );
  }
}
