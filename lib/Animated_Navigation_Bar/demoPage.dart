import 'package:flutter/material.dart';

import 'nav_bar.dart';

class DemoPage extends StatefulWidget {
  const DemoPage({super.key});

  @override
  State<DemoPage> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue,
        // appBar: AppBar(
        //   toolbarHeight: 70,
        //   backgroundColor: Colors.blue,
        //   title: Text('Animated Navigation Bar',style: TextStyle(color: Colors.white),),
        // ),
        body: Center(
          child: Text(showList[index],style: TextStyle(color: Colors.black),),
        ),
      ),
    );
  }
}
