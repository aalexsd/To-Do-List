import 'package:flutter/material.dart';

Widget searchBox(){
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
    ),
    child: const TextField(
      decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: 10),
          prefixIcon: Icon(Icons.search,
            color: Colors.black,
            size: 25,),
          border: InputBorder.none,
          hintText: 'Search'
      ),
      style: TextStyle(
          fontSize: 20
      ),
    ),
  );
}