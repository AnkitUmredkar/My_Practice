import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:modify_text/Animated_Navigation_Bar/demoPage_3.dart';
import 'demoPage.dart';
import 'demoPage_2.dart';
import 'demoPage_4.dart';
import 'demoPage_5.dart';

int index = 0;
List page =[
  DemoPage(),
  DemoPage2(),
  Demopage3(),
  Demopage4(),
  Demopage5(),
];

class AnimatedNavBar extends StatefulWidget {
  const AnimatedNavBar({super.key});

  @override
  State<AnimatedNavBar> createState() => _AnimatedNavBarState();
}

class _AnimatedNavBarState extends State<AnimatedNavBar> {
  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      Icon(Icons.list, size: 30),
      Icon(Icons.add, size: 30),
      Icon(Icons.home, size: 30),
      Icon(Icons.compare_arrows, size: 30),
      Icon(Icons.login, size: 30),
    ];
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: Colors.blue,
          title: Text('Animated Navigation Bar',style: TextStyle(color: Colors.white),),
        ),
        body: page[index],
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.blue,
          animationDuration: Duration(milliseconds: 400),
          index: index,
          items:items,
          onTap: (num) {
            setState(() {
              index = num;
            });
          },
        ),
      ),
    );
  }
}

List showList = [
  'Page 1',
  'Page 2',
  'Page 3',
  'Page 4',
  'Page 5',
];