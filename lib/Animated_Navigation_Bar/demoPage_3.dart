import 'package:flutter/material.dart';

import 'nav_bar.dart';

class Demopage3 extends StatefulWidget {
  const Demopage3({super.key});

  @override
  State<Demopage3> createState() => _Demopage3State();
}

class _Demopage3State extends State<Demopage3> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.teal,
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
              Text('Hello Flutter',style: TextStyle(color: Colors.black),),
            ],
          ),
        ),
      ),
    );
  }
}
