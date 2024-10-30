import 'package:flutter/material.dart';


class AnimatedSwitcherExample extends StatefulWidget {
  @override
  _AnimatedSwitcherExampleState createState() =>
      _AnimatedSwitcherExampleState();
}

class _AnimatedSwitcherExampleState extends State<AnimatedSwitcherExample> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AnimatedSwitcher Example")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Tap the button to increase the counter",
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(scale: animation, child: child);
              },
              child: Text(
                "$_counter",
                key: ValueKey<int>(_counter),
                style: const TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _incrementCounter,
              child: const Text("Increment"),
            ),
          ],
        ),
      ),
    );
  }
}
