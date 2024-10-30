import 'package:flutter/material.dart';

class ShaderMaskExample extends StatelessWidget {
  const ShaderMaskExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ShaderMask Example")),
      body: Center(
        child: ShaderMask(
          // Define the shader to apply
          shaderCallback: (Rect bounds) {
            return const LinearGradient(
              colors: [Colors.purple, Colors.blue, Colors.green],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(bounds);
          },
          blendMode: BlendMode.srcIn, // Determines how the mask blends with the child
          child: const Text(
            'Gradient Text',
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold,
              color: Colors.white, // This color will be masked by the gradient
            ),
          ),
        ),
      ),
    );
  }
}

