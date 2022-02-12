import 'package:flutter/material.dart';
import 'chat_screen.dart';
import 'profile.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  void _onTapIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  List _pages = [
    ProfileScreen(
      user: 'John',
    ),
    Chat(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey.shade300,
        selectedItemColor: Colors.white,
        currentIndex: currentIndex,
        onTap: _onTapIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat Home',
          ),
        ],
      ),
    );
  }
}

class ChatScreen {}
