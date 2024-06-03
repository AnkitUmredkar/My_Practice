import 'package:flutter/material.dart';

class listView extends StatefulWidget {
  const listView({super.key});

  @override
  State<listView> createState() => _listViewState();
}

class _listViewState extends State<listView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          toolbarHeight: 70,
          title: const Text(
            'ListView Exapmle',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: ListView_Builder(),
      ),
    );
  }
}

//todo ListView Example
ListView List_View() {
  return ListView(
    physics: const BouncingScrollPhysics(),
    reverse: true,
    //todo <------ this is new
    padding: const EdgeInsets.only(top: 20),
    scrollDirection: Axis.vertical,
    //todo <------ this is new
    children: List.generate(
      name.length,
      (index) => Text(
        '${name[index]}   ',
        style: const TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
      ),
    ),
  );
}

//todo ListView.Builder Example
ListView ListView_Builder() {
  return ListView.builder(
    itemBuilder: (context, index) {
      return Text(name[index],
          style: const TextStyle(fontSize: 21, fontWeight: FontWeight.bold));
    },
    itemCount: name.length,
    itemExtent: 100, //todo Space Between two item
  );
}

//todo ListView_Separated Example
ListView ListView_Separated() {
  return ListView.separated(
    itemBuilder: (context, index) {
      return Text(name[index],
          style: const TextStyle(fontSize: 21, fontWeight: FontWeight.bold));
    },
    itemCount: name.length,
    separatorBuilder: (context, index) {
      return const Divider(
        color: Colors.blue,
        height: 60,
        thickness: 3,
        endIndent: 10,
        indent: 5,
      );
    },
  );
}

List name = [
  'ankit',
  'lata',
  'narendra',
  'hiren',
  'parth',
  'praful',
  'om',
  'Avesh'
];
