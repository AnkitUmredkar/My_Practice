import 'package:flutter/material.dart';

class nestedScrollVidew extends StatelessWidget {
  const nestedScrollVidew({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              title: const Text('NestedScrollView Example',style: TextStyle(color: Colors.black),),
              expandedHeight: 100.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomLeft,
                        colors: [
                      Colors.deepPurple,
                      Colors.blue
                    ])
                  ),
                )
              ),
            ),
          ];
        },
        body: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) => ListTile(title: Text('Item $index')),
        ),
      ),
    );
  }
}
