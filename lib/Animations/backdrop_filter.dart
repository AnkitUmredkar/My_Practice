import 'package:flutter/material.dart';
import 'dart:ui';

class BackdropFilterExample extends StatelessWidget {
  const BackdropFilterExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BackdropFilter Example')),
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://i0.wp.com/picjumbo.com/wp-content/uploads/beautiful-nature-mountain-scenery-with-flowers-free-photo.jpg?w=2210&quality=70'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Blurred Overlay
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(
                  alignment: Alignment.center,
                  width: 300,
                  height: 200,
                  color: Colors.black.withOpacity(0.15),
                  child: const Text(
                    'Blurred Overlay',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

