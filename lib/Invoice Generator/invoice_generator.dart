import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'fill_information.dart';

GlobalKey<FormState> formkey = GlobalKey();
TextEditingController txtName = TextEditingController();
TextEditingController txtSurName = TextEditingController();
TextEditingController txtCategory = TextEditingController();
TextEditingController txtDate = TextEditingController();
TextEditingController txtDueDate = TextEditingController();
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
        backgroundColor: const Color(0xff181A20),
        appBar: AppBar(
          leading: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
          toolbarHeight: 70,
          backgroundColor: const Color(0xff0174ec),
          centerTitle: true,
          title: const Text(
            'Invoice Generator',
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
        body: (blanckOrNot)
            ? Column(
                children: [
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: height * 0.21),
                      child: Image.asset(
                        'assets/images/file.png',
                        height: height * 0.27,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Text(
                    'Generate Your Invoice',
                    style:
                        TextStyle(color: Colors.white, fontSize: width * 0.062),
                  )
                ],
              )
            : Padding(
                padding: const EdgeInsets.fromLTRB(15, 18, 10, 18),
                child: SingleChildScrollView(
                  child: Column(
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
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 18),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: Container(
                                    padding:
                                        EdgeInsets.only(left: width * 0.01),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        color: const Color(0xff35383F)),
                                    child: ListTile(
                                      title: Text(
                                        '${invoiceList[index].category}',
                                        style: TextStyle(
                                            fontSize: width * 0.045,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                      subtitle: Text(
                                          '${invoiceList[index].name} ${invoiceList[index].surName}',
                                          style: TextStyle(
                                              fontSize: width * 0.045,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white70)),
                                      trailing: Text('${totalList[index]}',
                                          style: TextStyle(
                                              fontSize: width * 0.045,
                                              color: Colors.white)),
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      editIndex = index;
                                      editInvoiceList = costList[editIndex];
                                    });
                                    Navigator.of(context)
                                        .pushNamed('/EditInformation');
                                  },
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                  ),
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
        floatingActionButton: GestureDetector(
            onTap: () {
              blanckOrNot = false;
              txtCost = TextEditingController();
              txtCostName = TextEditingController();
              costDetails = [
                {'costName': txtCostName, 'Cost': txtCost}
              ];
              txtDate = TextEditingController();
              txtDueDate = TextEditingController();
              txtName = TextEditingController();
              txtSurName = TextEditingController();
              txtCategory = TextEditingController();
              editOrNew = false;
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const FillDetails()));
            },
            child: Container(
                width: width * 0.925,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xff0174ec)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      color: Colors.white,
                      size: width * 0.06,
                    ),
                    Text(
                      ' Create New Invoice',
                      style: TextStyle(
                          color: Colors.white, fontSize: width * 0.045),
                    )
                  ],
                ))),
      ),
    );
  }
}

int? SelectedIndex;
List<InvoiceModel> invoiceList = [];
List costDetails = [];
List costList = [];
List showDetails = [];
List editInvoiceList = [];
bool editOrNew = false, blanckOrNot = true;
late int editIndex;

class InvoiceModel {
  String? name, surName, category, date, dueDate;

  InvoiceModel(
      {this.name, this.surName, this.category, this.date, this.dueDate});
}
