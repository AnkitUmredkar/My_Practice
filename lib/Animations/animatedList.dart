import 'package:flutter/material.dart';

class AnimatedListExample extends StatefulWidget {
  const AnimatedListExample({super.key});

  @override
  State<AnimatedListExample> createState() => _AnimatedListExampleState();
}

class _AnimatedListExampleState extends State<AnimatedListExample> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  final List<String> _items = List.generate(5, (index) => "Item $index");
  int _counter = 5;

  void _addItem() {
    final int index = _items.length;
    _items.add("Item $_counter");
    _counter++;
    _listKey.currentState?.insertItem(index, duration: const Duration(milliseconds: 500));
  }

  void _removeItem(int index) {
    _listKey.currentState?.removeItem(
      index, (context, animation) => _buildItem(_items[index], animation),
      duration: const Duration(milliseconds: 500),
    );
    _items.removeAt(index);
  }

  Widget _buildItem(String item, Animation<double> animation) {
    return SlideTransition(
      position: animation.drive(
        Tween<Offset>(begin: const Offset(1, 0), end: const Offset(0, 0))
            .chain(CurveTween(curve: Curves.easeInOut)),
      ),
      child: ListTile(
        title: Text(item),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            _removeItem(_items.indexOf(item));
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("AnimatedList Example"),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _addItem,
          ),
        ],
      ),
      body: AnimatedList(
        key: _listKey,
        initialItemCount: _items.length,
        itemBuilder: (context, index, animation) {
          return _buildItem(_items[index], animation);
        },
      ),
    );
  }
}
