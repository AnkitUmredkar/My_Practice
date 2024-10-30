import 'package:flutter/material.dart';

import 'nav_bar.dart';

class Demopage5 extends StatefulWidget {
  const Demopage5({super.key});

  @override
  State<Demopage5> createState() => _Demopage5State();
}

class _Demopage5State extends State<Demopage5> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.yellow,
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
              Text('Hello C++',style: TextStyle(color: Colors.black),),
            ],
          ),
        ),
      ),
    );
  }
}
