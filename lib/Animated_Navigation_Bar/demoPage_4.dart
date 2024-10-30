import 'package:flutter/material.dart';

import 'nav_bar.dart';

class Demopage4 extends StatefulWidget {
  const Demopage4({super.key});

  @override
  State<Demopage4> createState() => _Demopage4State();
}

class _Demopage4State extends State<Demopage4> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.tealAccent,
        // appBar: AppBar(
        //   toolbarHeight: 70,
        //   backgroundColor: Colors.blue,
        //   title: Text('Animated Navigation Bar',style: TextStyle(color: Colors.white),),
        // ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(showList[index],style: TextStyle(color: Colors.black),),
                  Text('Hello C Language',style: TextStyle(color: Colors.black),),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
