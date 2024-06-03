import 'package:flutter/material.dart';
import 'package:modify_text/Modify_text_Widget/text.dart';

AppBar appbar() {
  return AppBar(
    toolbarHeight: 70,
    backgroundColor: Colors.red,
    // centerTitle: true,
    leading: const Icon(Icons.menu, color: Colors.white),
    title: Text(textOfAppbar(),    //function
      style: const TextStyle(
        color: Colors.white,
        fontSize : 26,
      ),),
    centerTitle: true,
  );
}