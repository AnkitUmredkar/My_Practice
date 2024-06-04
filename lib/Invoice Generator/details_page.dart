import 'dart:typed_data';
import 'package:modify_text/Invoice%20Generator/fill_information.dart';
import 'package:flutter/material.dart';
import 'package:modify_text/Invoice%20Generator/invoice_generator.dart';

import '../Table/tableExample.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            '${invoiceList[SelectedIndex!].category}',
            style: TextStyle(color: Colors.white, fontSize: width * 0.05),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
          toolbarHeight: 70,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
        floatingActionButton: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/pdf');
            },
            child: Container(
                height: height * 0.1,
                width: width * 0.2,
                decoration: const BoxDecoration(
                    color: Colors.blue, shape: BoxShape.circle),
                child: const Icon(
                  Icons.picture_as_pdf,
                  color: Colors.white,
                  size: 30,
                ))),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: invoiceBill(width),
          ),
        ),
      ),
    );
  }
}

Padding invoiceBill(double width) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(12, 20, 12, 10),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Customer',
              style: TextStyle(fontSize: width * 0.064, color: Colors.black87),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('    ${invoiceList[SelectedIndex!].name}',
                    style:
                        TextStyle(fontSize: width * 0.084, color: Colors.grey)),
                Text('    ${invoiceList[SelectedIndex!].surName}',
                    style:
                        TextStyle(fontSize: width * 0.084, color: Colors.grey)),
              ],
            ),
          ],
        ),
        const Divider(
          thickness: 2,
          color: Color(0xffc3c3c3ff),
        ),
        const SizedBox(height: 8),
        Text(
          'Invoice Items',
          style: TextStyle(fontSize: width * 0.058, color: Colors.black),
        ),
        ...List.generate(
          showDetails.length,
          (index) => ListTile(
            leading: Text(
              showDetails[index]['costName'].text,
              style: TextStyle(fontSize: width * 0.047, color: Colors.grey),
            ),
            trailing: Text(
              showDetails[index]['Cost'].text,
              style: TextStyle(fontSize: width * 0.047, color: Colors.grey),
            ),
          ),
        ),
        ListTile(
          leading: Text(
            'Total',
            style: TextStyle(color: Colors.black54, fontSize: width * 0.076),
          ),
          trailing: Text(
            '${totalList[SelectedIndex!].toDouble()}/-',
            style: TextStyle(color: Colors.black54, fontSize: width * 0.076),
          ),
        ),
        const Divider(
          thickness: 2,
          color: Color(0xffc3c3c3),
        ),
      ],
    ),
  );
}
