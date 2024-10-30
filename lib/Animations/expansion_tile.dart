import 'package:flutter/material.dart';


class ExpansionTileExample extends StatelessWidget {
  const ExpansionTileExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ExpansionTile Example")),
      body: ListView(
        children: [
          Material(
            color: Colors.transparent, // Set color to transparent
            child: ExpansionTile(
              title: const Text("Panel 1"),
              leading: const Icon(Icons.expand_more),
              children: [
                ListTile(
                  title: const Text("This is item 1 in Panel 1"),
                ),
                ListTile(
                  title: const Text("This is item 2 in Panel 1"),
                ),
              ],
            ),
          ),
          Material(
            color: Colors.transparent, // Set color to transparent
            child: ExpansionTile(
              title: const Text("Panel 2"),
              leading: const Icon(Icons.expand_more),
              children: [
                ListTile(
                  title: const Text("This is item 1 in Panel 2"),
                ),
                ListTile(
                  title: const Text("This is item 2 in Panel 2"),
                ),
              ],
            ),
          ),
          Material(
            color: Colors.transparent, // Set color to transparent
            child: ExpansionTile(
              title: const Text("Panel 3"),
              leading: const Icon(Icons.expand_more),
              children: [
                ListTile(
                  title: const Text("This is item 1 in Panel 3"),
                ),
                ListTile(
                  title: const Text("This is item 2 in Panel 3"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
