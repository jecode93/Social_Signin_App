import 'package:flutter/material.dart';

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Home'),
      ),
      body: Center(
        child: Text(
          'No message yet',
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}
