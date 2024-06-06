import 'dart:math';
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
        backgroundColor: const Color(0xff181A20),
        appBar: AppBar(
          backgroundColor: const Color(0xff0174ec),
          title: Text(
            '${invoiceList[SelectedIndex!].category}',
            style: TextStyle(color: Colors.white, fontSize: width * 0.06),
          ),
          centerTitle: true,
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
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: invoiceBill(width),
          ),
        ),
        floatingActionButton: GestureDetector(
            onTap: () {
              Random random = Random();
              invoiceNumber = random.nextInt(1000000);
              Navigator.of(context).pushNamed('/pdf');
            },
            child: Container(
                height: height * 0.1,
                width: width * 0.2,
                decoration: const BoxDecoration(
                    color: Color(0xff0174ec), shape: BoxShape.circle),
                child: const Icon(
                  Icons.picture_as_pdf,
                  color: Colors.white,
                  size: 30,
                ))),
      ),
    );
  }
}

Padding invoiceBill(double width) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(12, 20, 12, 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Customer Name :',
          style: TextStyle(fontSize: width * 0.058, color: Colors.white),
        ),
        Row(
          children: [
            Text('${invoiceList[SelectedIndex!].name}',
                style:
                    TextStyle(fontSize: width * 0.084, color: Colors.white70)),
            Text(' ${invoiceList[SelectedIndex!].surName}',
                style:
                    TextStyle(fontSize: width * 0.084, color: Colors.white70)),
          ],
        ),
        const Divider(
          thickness: 2,
          color: Colors.white70,
        ),
        const SizedBox(height: 8),
        Text(
          'Invoice Items',
          style: TextStyle(fontSize: width * 0.058, color: Colors.white),
        ),
        ...List.generate(
          showDetails.length,
          (index) => ListTile(
            leading: Text(
              showDetails[index]['costName'].text,
              style: TextStyle(fontSize: width * 0.047, color: Colors.white70),
            ),
            trailing: Text(
              '${double.parse(showDetails[index]['Cost'].text)}/-',
              style: TextStyle(fontSize: width * 0.047, color: Colors.white70),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: TextStyle(color: Colors.white, fontSize: width * 0.065),
              ),
              Text(
                '${totalList[SelectedIndex!]}/-',
                style: TextStyle(color: Colors.white, fontSize: width * 0.065),
              ),
            ],
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

int invoiceNumber = 0;
