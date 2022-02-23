import 'package:flutter/material.dart';
import 'package:signin_app/screens/home.dart';

class AuthForm extends StatefulWidget {
  const AuthForm(this.submitFn, this.isloading);

  final void Function(String email, String username, String pass, bool isLogin)
      submitFn;
  final bool isloading;

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();

  var _isLogin = true;
  var _registerMail;
  var _registerPass;
  var _username;

  void _validateAndSave() {
    final isFormValid = _formKey.currentState!.validate();

    FocusScope.of(context).unfocus();
    if (isFormValid) {
      _formKey.currentState!.save();
      widget.submitFn(
        _registerMail,
        _username,
        _registerPass,
        _isLogin,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 10.0,
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(children: [
                        TextFormField(
                          key: ValueKey('email'),
                          decoration: InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.mail),
                          ),
                          onSaved: (newMail) => _registerMail = newMail,
                          validator: (value) => value!.isNotEmpty
                              ? null
                              : 'Please enter your email to sign up!',
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        if (!_isLogin)
                          TextFormField(
                            key: ValueKey('username'),
                            decoration: InputDecoration(
                              labelText: 'Username',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.person),
                            ),
                            onSaved: (newUsername) => _username = newUsername,
                            validator: (value) =>
                                value!.isNotEmpty || value.length < 4
                                    ? null
                                    : 'Please enter an Username!',
                          ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          key: ValueKey('password'),
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.lock),
                          ),
                          validator: (value) => value!.isNotEmpty
                              ? null
                              : 'Please enter a password!',
                          onSaved: (newPassword) => _registerPass = newPassword,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        if (widget.isloading) CircularProgressIndicator(),
                        if (!widget.isloading)
                          ElevatedButton(
                            onPressed: _validateAndSave,
                            child: Text(_isLogin ? 'Sign In' : 'Sign Up'),
                          ),
                        if (!widget.isloading)
                          TextButton(
                            onPressed: () {
                              setState(() {
                                _isLogin = !_isLogin;
                              });
                            },
                            child: Text(
                              _isLogin
                                  ? 'Don\'t have an account?'
                                  : 'Already have an account !',
                            ),
                          ),
                      ]),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
