import 'package:flutter/material.dart';

//todo here i also explain AnimatedIcon

class AnimationControllerExample extends StatefulWidget {
  const AnimationControllerExample({super.key});

  @override
  State<AnimationControllerExample> createState() =>
      _AnimationControllerExampleState();
}

class _AnimationControllerExampleState extends State<AnimationControllerExample>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  //todo animation controller gives value between 0 to 1 like 0.1, 0.2, 0.3

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController
    _controller = AnimationController(
      duration: const Duration(seconds: 2), // Animation duration
      vsync: this, // Provides a Ticker for the controller
    )..repeat(reverse: true); // Repeats animation in reverse

    // Set up a listener to update the UI on each tick

    _controller.addListener(() {
      setState(() {}); // Rebuilds the widget tree with each frame
    });

    _controller.addStatusListener(
      (status) {
        print(status);
      },
    );
  }

  void _toggleAnimation() {
    if (_controller.isCompleted) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the controller when no longer needed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AnimationController Example")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(onPressed: _toggleAnimation,icon: AnimatedIcon(icon: AnimatedIcons.add_event, progress: _controller)),
            Transform.rotate(
              angle: _controller.value + 1,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
