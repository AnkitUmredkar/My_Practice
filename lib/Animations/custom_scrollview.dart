import 'package:flutter/material.dart';

class CustomScrollViewExample extends StatelessWidget {
  const CustomScrollViewExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Collapsible AppBar
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: const Text("Custom Scroll View"),
              background: Image.network(
                "https://via.placeholder.com/400x200",
                fit: BoxFit.cover,
              ),
            ),
          ),
          // SliverList displaying a list of items
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => ListTile(
                leading: CircleAvatar(child: Text("${index + 1}")),
                title: Text("List Item $index"),
                subtitle: Text("Subtitle $index"),
              ),
              childCount: 20, // Number of items in the list
            ),
          ),
          // Adding some spacing
          const SliverPadding(
            padding: EdgeInsets.all(8.0),
          ),
          // SliverGrid displaying a grid of items
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              childAspectRatio: 1.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) => Container(
                color: Colors.teal[100 * ((index % 9) + 1)],
                child: Center(child: Text("Grid $index")),
              ),
              childCount: 12, // Number of items in the grid
            ),
          ),
        ],
      ),
    );
  }
}
