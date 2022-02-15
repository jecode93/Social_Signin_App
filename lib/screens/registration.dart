import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widget/form_content.dart';

class RegistrationForms extends StatefulWidget {
  const RegistrationForms({Key? key}) : super(key: key);

  @override
  _RegistrationFormsState createState() => _RegistrationFormsState();
}

class _RegistrationFormsState extends State<RegistrationForms> {
  static const routeName = '/registration';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SignInForm(),
      ),
    );
  }
}
