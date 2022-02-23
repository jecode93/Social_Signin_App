import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:signin_app/widget/custom_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../screens/auth_form.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInButtons extends StatefulWidget {
  const SignInButtons({
    Key? key,
  }) : super(key: key);

  @override
  State<SignInButtons> createState() => _SignInButtonsState();
}

class _SignInButtonsState extends State<SignInButtons> {
  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;

    var _isLoading = false;
    void _submitAuthForm(
      String email,
      String username,
      String password,
      bool isLogin,
    ) async {
      UserCredential authResult;
      try {
        setState(() {
          _isLoading = true;
        });
        if (isLogin) {
          authResult = await _auth.signInWithEmailAndPassword(
              email: email, password: password);
        } else {
          authResult = await _auth.createUserWithEmailAndPassword(
              email: email, password: password);
          await FirebaseFirestore.instance
              .collection('users')
              .doc(authResult.user!.uid)
              .set({
            'username': username,
            'email': email,
          });
        }
      } on PlatformException catch (e) {
        var message = 'An error occured, please check your credential';
        if (e.message != null) {
          message = e.message!;
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Theme.of(context).errorColor,
            content: Text(message),
          ),
        );
        setState(() {
          _isLoading = false;
        });
      } catch (e) {
        print(e);

        setState(() {
          _isLoading = false;
        });
      }
    }

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
                  builder: (context) => AuthForm(
                    _submitAuthForm,
                    _isLoading,
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
