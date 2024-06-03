import 'package:flutter/material.dart';

class tableExample extends StatefulWidget {
  const tableExample({super.key});

  @override
  State<tableExample> createState() => _tableExampleState();
}

class _tableExampleState extends State<tableExample> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          backgroundColor: Colors.blue,
          title: const Text(
            'Table Widget',
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Table(
              border: TableBorder.all(color: Colors.black87, width: 2),
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              columnWidths: const {
                0: FixedColumnWidth(150),
                1: FixedColumnWidth(75),
                2: FixedColumnWidth(75),
                3: FixedColumnWidth(75),
              },
              children: [
                const TableRow(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                          child: Text(
                        '',
                        style: TextStyle(fontSize: 28),
                      )),
                    ),
                    Center(
                        child: Icon(
                      Icons.android,
                      size: 28,
                      color: Colors.green,
                    )),
                    Center(
                        child: Icon(
                      Icons.apple,
                      size: 28,
                      color: Colors.black,
                    )),
                    Center(
                        child: Icon(
                      Icons.window,
                      size: 28,
                      color: Colors.blue,
                    )),
                  ],
                ),
                buildTableRow('Ankit', Icons.check_box_rounded,
                    Icons.check_box_rounded, Icons.close_rounded),
                buildTableRow('Praful', Icons.close_rounded,
                    Icons.check_box_rounded, Icons.close_rounded),
                buildTableRow('Om', Icons.check_box_rounded,
                    Icons.close_rounded, Icons.check_box_rounded),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

TableRow buildTableRow(String data, var i1, var i2, var i3) {
  return TableRow(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
            child: Text(
          data,
          style: const TextStyle(fontSize: 20),
        )),
      ),
      Center(
          child: Icon(
        i1,
        color: (i1 == Icons.check_box_rounded) ? Colors.green : Colors.red,
      )),
      Center(
          child: Icon(
        i2,
        color: (i2 == Icons.check_box_rounded) ? Colors.green : Colors.red,
      )),
      Center(
          child: Icon(
        i3,
        color: (i3 == Icons.check_box_rounded) ? Colors.green : Colors.red,
      )),
    ],
  );
}
