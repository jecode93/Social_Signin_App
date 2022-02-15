import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegistrationForms extends StatefulWidget {
  const RegistrationForms({Key? key}) : super(key: key);

  @override
  _RegistrationFormsState createState() => _RegistrationFormsState();
}

class _RegistrationFormsState extends State<RegistrationForms> {
  final _formKey = GlobalKey<FormState>();

  String? registerMail;
  dynamic registerPass;

  List info = [];

  bool _validateAndSave() {
    final form = _formKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void _submitForm() {
    if (_validateAndSave()) {
      info.add(
        {'Mail': registerMail, 'Pass': registerPass},
      );
    }

    print(info);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'Sign Up',
                    style: GoogleFonts.roboto(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(children: [
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.mail),
                          ),
                          onSaved: (newMail) => registerMail = newMail,
                          validator: (value) => value!.isNotEmpty
                              ? null
                              : 'Please enter your email to sign up!',
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.lock),
                          ),
                          validator: (value) => value!.isNotEmpty
                              ? null
                              : 'Please enter a password!',
                          onSaved: (newPassword) => registerPass = newPassword,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        ElevatedButton(
                          onPressed: _submitForm,
                          child: Text('Sign Up'),
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