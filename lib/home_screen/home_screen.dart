import 'package:flutter/material.dart';
import 'package:to_do_app/widgets/search_box.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEFF5),
      appBar: _buildAppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            searchBox(),
          ],
        ),
      ),
    );
  }
}

AppBar _buildAppBar() {
  return AppBar(
    elevation: 0,
    backgroundColor: const Color(0xFFEEEFF5),
    leading: const Icon(Icons.menu),
    actions: const [
      Padding(
        padding: EdgeInsets.only(right: 15.0),
        child: CircleAvatar(
          backgroundImage: AssetImage('assets/images/avatar.jpeg'),
        ),
      )
    ],
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
  );
}


