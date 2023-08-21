import 'package:flutter/material.dart';
import 'package:flutter_login_bloc/welcome/Welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: welcome_page(),
    );
  }
}

