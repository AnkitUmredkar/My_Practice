import 'package:animated_react_button/animated_react_button.dart';
import 'package:flutter/material.dart';

class AnimatedLikeButtonEx extends StatefulWidget {
  const AnimatedLikeButtonEx({super.key});

  @override
  State<AnimatedLikeButtonEx> createState() => _AnimatedLikeButtonExState();
}

class _AnimatedLikeButtonExState extends State<AnimatedLikeButtonEx> {
  bool isLiked = false;

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Animated Like Button")),
      body: Center(
        child: AnimatedReactButton(
          reactColor: isLiked ? Colors.red : Colors.grey,
          onPressed: toggleLike,
          defaultIcon: isLiked ? Icons.favorite_border : Icons.favorite,
        ),
      ),
    );
  }
}
