import 'package:flutter/material.dart';

class LayoutBuilderExample extends StatelessWidget {
  const LayoutBuilderExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("LayoutBuilder Example")),
      body: Center(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            // Checking if the available width is less than or equal to 600 pixels
            if (constraints.maxWidth <= 600) {
              return Container(
                color: Colors.blue,
                width: constraints.maxWidth,
                height: 200,
                child: const Center(
                  child: Text(
                    "Small Screen",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
              );
            } else {
              return Container(
                color: Colors.green,
                width: constraints.maxWidth,
                height: 200,
                child: const Center(
                  child: Text(
                    "Large Screen",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

