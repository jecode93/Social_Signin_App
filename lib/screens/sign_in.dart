import 'package:flutter/material.dart';
import 'package:signin_app/widget/body.dart';

class SignInPage extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const SignInPage(this.title);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: const Body(),
    );
  }
}
