import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key, required this.user}) : super(key: key);

  final String user;

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User'),
      ),
      body: Center(
        child: Text(
          'Welcome ${widget.user}',
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}
