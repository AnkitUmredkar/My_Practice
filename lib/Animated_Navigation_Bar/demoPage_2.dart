import 'package:flutter/material.dart';

import 'nav_bar.dart';

class DemoPage2 extends StatefulWidget {
  const DemoPage2({super.key});

  @override
  State<DemoPage2> createState() => _DemoPage2State();
}

class _DemoPage2State extends State<DemoPage2> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.red,
        // appBar: AppBar(
        //   toolbarHeight: 70,
        //   backgroundColor: Colors.blue,
        //   title: Text('Animated Navigation Bar',style: TextStyle(color: Colors.white),),
        // ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(showList[index],style: TextStyle(color: Colors.black),),
              Text('Hello Dart',style: TextStyle(color: Colors.black),),
            ],
          ),
        ),
      ),
    );
  }
}
