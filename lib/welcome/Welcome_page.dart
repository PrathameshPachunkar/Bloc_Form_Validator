import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login_bloc/Sign_in/Sign_in_page.dart';
import 'package:flutter_login_bloc/Sign_in/SingIn_bloc.dart';

class welcome_page extends StatelessWidget {
  const welcome_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Welcome",

            style: TextStyle(
              color: Colors.blueAccent,
              fontSize: 30,
            ),
          ),

         SizedBox(
           height: 30,
         ),
         CupertinoButton(
           color: Colors.blueAccent,
             child: const Center(
                 child: Text("Sign in with Email")),
             onPressed: () {
            Navigator.push(context,  MaterialPageRoute(builder: (BuildContext
            context)=>BlocProvider(create: (context)=>SignIn_bloc(),
              child: const Sign_in_page(),
            )));
             }
             ),

          CupertinoButton(

              color: Colors.blueAccent,
              child: const Center(
                  child: Text("Sign in with Google")),
              onPressed: (){}),
        ],
      ),
    );
  }
}
