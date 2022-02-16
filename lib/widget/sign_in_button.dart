import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:signin_app/widget/custom_button.dart';

import '../screens/login_page.dart';
import '../screens/sign_up_page.dart';

class SignInButtons extends StatelessWidget {
  const SignInButtons({
    Key? key,
    required this.email,
    required this.password,
  }) : super(key: key);

  final String email;
  final String password;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomButton(
            labelText: 'Sign In With Google',
            imagePath: 'assets/images/google-logo.png',
            buttonColor: Colors.white,
            textColor: Colors.black,
            onPressed: () {},
          ), // Google button
          CustomButton(
            labelText: 'Sign In With Facebook',
            imagePath: 'assets/images/facebook-logo.png',
            buttonColor: Colors.blue.shade800,
            textColor: Colors.white,
            onPressed: () {},
          ),
          CustomButton(
            labelText: 'Sign In With Email',
            imagePath: 'assets/images/mail.png',
            buttonColor: Colors.red,
            textColor: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SignInForm(
                    email: email,
                    password: password,
                  ),
                ),
              );
            },
          ),
          const Text(
            'Or',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          CustomButton(
            labelText: 'Anonymous',
            imagePath: 'assets/images/anonymous.png',
            buttonColor: Colors.white,
            textColor: Colors.black,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
