import 'package:flutter/material.dart';
// import 'package:signin_app/screens/home.dart';
import 'screens/sign_in.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social Sign In app',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: SignInPage('Sign In'),
      debugShowCheckedModeBanner: false,
    );
  }
}
