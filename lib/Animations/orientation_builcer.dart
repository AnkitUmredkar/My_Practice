import 'package:flutter/material.dart';

class OrientationBuilderExample extends StatelessWidget {
  const OrientationBuilderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("OrientationBuilder Example")),
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.phone_android, size: 100, color: Colors.blue),
                  const SizedBox(height: 20),
                  const Text(
                    "Portrait Mode",
                    style: TextStyle(fontSize: 24),
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.tablet_mac, size: 100, color: Colors.green),
                  const SizedBox(width: 20),
                  const Text(
                    "Landscape Mode",
                    style: TextStyle(fontSize: 24),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}