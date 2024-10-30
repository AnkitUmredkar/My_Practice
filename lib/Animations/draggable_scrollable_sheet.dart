import 'package:flutter/material.dart';

class DraggableScrollableSheetExample extends StatelessWidget {
  const DraggableScrollableSheetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Draggable Scrollable Sheet Example"),
      ),
      body: Stack(
        children: [
          // Main background content (can be any widget)
          Center(
            child: Text(
              "Main Content Area",
              style: TextStyle(fontSize: 24, color: Colors.grey[700]),
            ),
          ),
          // DraggableScrollableSheet for the bottom sheet
          DraggableScrollableSheet(
            initialChildSize: 0.3,  // Initial height when sheet appears (30% of screen)
            minChildSize: 0.2,       // Minimum height (20% of screen)
            maxChildSize: 0.8,       // Maximum height (80% of screen)
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 8.0,
                      spreadRadius: 2.0,
                    ),
                  ],
                ),
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: 30,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: const Icon(Icons.star, color: Colors.amber),
                      title: Text("Item $index"),
                      subtitle: Text("Subtitle $index"),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

