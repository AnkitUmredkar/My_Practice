import 'package:flutter/material.dart';
import 'fill_information.dart';

GlobalKey<FormState> formkey = GlobalKey();
TextEditingController txtName = TextEditingController();
TextEditingController txtCategory = TextEditingController();
TextEditingController txtCost = TextEditingController();
TextEditingController txtCostName = TextEditingController();

class InvoiceGenerator extends StatefulWidget {
  const InvoiceGenerator({super.key});

  @override
  State<InvoiceGenerator> createState() => _InvoiceGeneratorState();
}

class _InvoiceGeneratorState extends State<InvoiceGenerator> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.arrow_back,
            color: Colors.blue,
          ),
          toolbarHeight: 70,
          backgroundColor: Colors.blue,
          centerTitle: true,
          title: const Text(
            'Invoice Generator',
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
        body: Column(
          children: [
            ...List.generate(
              invoiceList.length,
              (index) => GestureDetector(
                onTap: () {
                  setState(() {
                    showDetails = [];
                    SelectedIndex = index;
                    showDetails = costList[SelectedIndex!];
                  });
                  Navigator.of(context).pushNamed('/DetailsPage');
                },
                child: ListTile(
                  title: Text(
                    '${invoiceList[index].category}',
                    style: TextStyle(
                        fontSize: width * 0.041, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('${invoiceList[index].name}',
                      style: TextStyle(
                          fontSize: width * 0.041,
                          color: Colors.black54,
                          fontWeight: FontWeight.bold)),
                  trailing: Text('${totalList[index]}',
                      style: TextStyle(fontSize: width * 0.041)),
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            txtCost = TextEditingController();
            txtCostName = TextEditingController();
            costDetails = [
              {'costName': txtCostName, 'Cost': txtCost}
            ];
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const FillDetails()));
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

int? SelectedIndex;
List<InvoiceModel> invoiceList = [];
List costDetails = [];
List costList = [];
List showDetails = [];

class InvoiceModel {
  String? name, category;

  InvoiceModel({this.name, this.category});
}
