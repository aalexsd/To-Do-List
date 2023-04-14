import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFEEEFF5),
        leading: const Icon(Icons.menu),
        actions: const [
           Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/avatar.jpeg'),
            ),
          )
        ],
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
    );
  }
}
