import 'dart:async';

import 'package:flutter/material.dart';

import 'invoice_generator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        value = value + 0.2;
        if (value == 1) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const InvoiceGenerator()),
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff272728),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 30),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/images/img.png',
                      height: width * 0.5,
                    ),
                     Text(
                      '             GST\n Invoice Generator',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: width * 0.08),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 18,
                  width: width,
                  margin: const EdgeInsets.only(left: 8, right: 8),
                  child: LinearProgressIndicator(
                    backgroundColor: Colors.blueGrey,
                    borderRadius: BorderRadius.circular(30),
                    value: value,
                    color: const Color(0xff002296),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

double value = 0;
