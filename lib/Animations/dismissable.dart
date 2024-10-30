import 'package:flutter/material.dart';

class DismissibleExample extends StatefulWidget {
  const DismissibleExample({super.key});

  @override
  State<DismissibleExample> createState() => _DismissibleExampleState();
}

class _DismissibleExampleState extends State<DismissibleExample> {
  // Sample data
  List<String> items = List.generate(10, (index) => "Item ${index + 1}");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dismissible Example"),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(items[index]), // Unique key for each item
            direction: DismissDirection.endToStart, // Swipe right to left
            onDismissed: (direction) {
              setState(() {
                items.removeAt(index);
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("${items[index]} dismissed")),
              );
            },
            onUpdate: (details) => print(details),
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            child: ListTile(
              title: Text(items[index]),
            ),
          );
        },
      ),
    );
  }
}

