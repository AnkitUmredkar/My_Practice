import 'package:flutter/material.dart';

class ExpansionPanelListExample extends StatefulWidget {
  const ExpansionPanelListExample({super.key});

  @override
  State<ExpansionPanelListExample> createState() => _ExpansionPanelListExampleState();
}

class _ExpansionPanelListExampleState extends State<ExpansionPanelListExample> {
  // Sample data
  final List<Item> _data = List.generate(
    5,
        (index) => Item(
      id: index, // Add an ID for each item
      headerValue: 'Panel $index',
      expandedValue: 'This is the detail for panel $index',
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ExpansionPanelList Example")),
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              _data[index].isExpanded = !isExpanded;
            });
          },
          children: _data.map<ExpansionPanel>((Item item) {
            return ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  title: Text(item.headerValue),
                );
              },
              body: ListTile(
                title: Text(item.expandedValue),
                subtitle: const Text('To delete this panel, tap the trash icon'),
                trailing: const Icon(Icons.delete),
                onTap: () {
                  setState(() {
                    _data.removeWhere((currentItem) => currentItem == item);
                  });
                },
              ),
              isExpanded: item.isExpanded,
              canTapOnHeader: true, // Allows toggling by tapping on the header
            );
          }).toList(),
        ),
      ),
    );
  }
}

// Model class for holding item data
class Item {
  Item({
    required this.id,
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  final int id; // Unique ID for each item
  String expandedValue;
  String headerValue;
  bool isExpanded;
}

