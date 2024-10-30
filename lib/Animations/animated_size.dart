import 'package:flutter/material.dart';

class AnimatedSizeExample extends StatefulWidget {
  const AnimatedSizeExample({super.key});

  @override
  _AnimatedSizeExampleState createState() => _AnimatedSizeExampleState();
}

class _AnimatedSizeExampleState extends State<AnimatedSizeExample>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AnimatedSize Example")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedSize(
              duration: const Duration(seconds: 1),
              curve: Curves.easeIn,
              child: Container(
                width: _isExpanded ? 200 : 100,
                height: _isExpanded ? 200 : 100,
                color: Colors.blue,
                alignment: Alignment.center,
                child: const Text(
                  "Tap to Resize",
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isExpanded = !_isExpanded;
                });
              },
              child: const Text("Toggle Size"),
            ),
          ],
        ),
      ),
    );
  }
}

