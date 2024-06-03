import 'package:flutter/material.dart';

int x = 0, check = 0;
String winMsg = '';
String tieMsg = '';
bool checkTie = false;
List storeOX = List.generate(9, (index) => '');
List store = [];
int c1 = -1, c2 = -1, c3 = -1;

Container buildContainer(double width, String Inner, int index) {
  return Container(
    margin: const EdgeInsets.only(bottom: 8),
    height: width * 0.28,
    width: width * 0.28,
    alignment: Alignment.center,
    decoration: BoxDecoration(
        color: (c1 == index || c2 == index || c3 == index)
            ? Colors.teal
            : Colors.black),
    child: Text(
      Inner,
      style: TextStyle(
          color: (c1 == index || c2 == index || c3 == index)
              ? Colors.black
              : Colors.teal,
          fontSize: 72),
    ),
  );
}

bool checkWin(List storeOX, String Term) {
  if (storeOX[0] == Term && storeOX[1] == Term && storeOX[2] == Term) {
    c1 = 0;
    c2 = 1;
    c3 = 2;
    return true;
  } else if (storeOX[3] == Term && storeOX[4] == Term && storeOX[5] == Term) {
    c1 = 3;
    c2 = 4;
    c3 = 5;
    return true;
  } else if (storeOX[6] == Term && storeOX[7] == Term && storeOX[8] == Term) {
    c1 = 6;
    c2 = 7;
    c3 = 8;
    return true;
  } else if (storeOX[0] == Term && storeOX[3] == Term && storeOX[6] == Term) {
    c1 = 0;
    c2 = 3;
    c3 = 6;
    return true;
  } else if (storeOX[1] == Term && storeOX[4] == Term && storeOX[7] == Term) {
    c1 = 1;
    c2 = 4;
    c3 = 7;
    return true;
  } else if (storeOX[2] == Term && storeOX[5] == Term && storeOX[8] == Term) {
    c1 = 2;
    c2 = 5;
    c3 = 8;
    return true;
  } else if (storeOX[0] == Term && storeOX[4] == Term && storeOX[8] == Term) {
    c1 = 0;
    c2 = 4;
    c3 = 8;
    return true;
  } else if (storeOX[2] == Term && storeOX[4] == Term && storeOX[6] == Term) {
    c1 = 2;
    c2 = 4;
    c3 = 6;
    return true;
  }
  return false;
}
