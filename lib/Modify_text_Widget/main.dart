import "package:flutter/material.dart";

import "appBar_widget.dart";

void main() {
  runApp(
    MaterialApp(
      title: 'Demo App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: appbar(), //function
        body: const Center(
          child: FlutterLogo(
            size: 150,
          ),
        ),
      ),
    ),
  );
}
