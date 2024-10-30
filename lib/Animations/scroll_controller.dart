import 'package:flutter/material.dart';

class ScrollControllerExample extends StatefulWidget {
  const ScrollControllerExample({super.key});

  @override
  State<ScrollControllerExample> createState() =>
      _ScrollControllerExampleState();
}

class _ScrollControllerExampleState extends State<ScrollControllerExample> {
  final ScrollController _scrollController = ScrollController();
  final List<String> _items = List.generate(50, (index) => 'Item ${index + 1}');
  double width = 100.0;

  @override
  void initState() {
    super.initState();

    // Adding a scroll listener
    _scrollController.addListener(() {
      print(_scrollController.offset);
      if(_scrollController.offset > 80){
        setState(() {
          width = 200;
        });
      }
      else{
        setState(() {
          width = 100;
        });
      }
      if (_scrollController.position.atEdge) {
        bool isTop = _scrollController.position.pixels == 0;
        if (isTop) {
          print("Reached the top");
        } else {
          print("Reached the bottom");
        }
      }
    });
  }

  // Clean up the ScrollController
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // Function to scroll to the bottom
  void _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(seconds: 1),
      curve: Curves.easeOut,
    );
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      _scrollController.position.minScrollExtent,
      duration: const Duration(seconds: 2),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ScrollController Example")),
      body: Column(
        children: [
          Row(
            children: [
              ElevatedButton(
                onPressed: _scrollToBottom,
                child: const Text("Scroll to Bottom"),
              ),
              ElevatedButton(
                onPressed: _scrollToTop,
                child: const Text("Scroll to Top"),
              ),
            ],
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            height: 50,
            width: width,
            color: Colors.blue,
          ),
          Expanded(
            child: ListView.builder(
              controller: _scrollController, // Attach ScrollController
              itemCount: _items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_items[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
