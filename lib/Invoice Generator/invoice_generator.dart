import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'details_page.dart';
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
          title: Text(
            'Invoice Generator',
            style: TextStyle(color: Colors.white, fontSize: width * 0.064),
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
                        TextStyle(color: Colors.white, fontSize: width * 0.068),
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
                            Navigator.push(
                                context,
                                PageTransition(
                                    child: DetailsPage(),
                                    type: PageTransitionType.bottomToTopPop,
                                    childCurrent: InvoiceGenerator(),
                                    alignment: Alignment.center,
                                    duration: Duration(seconds: 1)
                                ));

                            // Navigator.of(context).pushNamed('/DetailsPage');
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
                                      txtName.text =
                                          invoiceList[editIndex].name!;
                                      txtSurName.text =
                                          invoiceList[editIndex].surName!;
                                      txtCategory.text =
                                          invoiceList[editIndex].category!;
                                      txtDate.text =
                                          invoiceList[editIndex].date!;
                                      txtDueDate.text =
                                          invoiceList[editIndex].dueDate!;
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
              Navigator.push(
                  context,
                  PageTransition(
                      child: FillDetails(),
                      type: PageTransitionType.leftToRight));
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
                          color: Colors.white, fontSize: width * 0.05),
                    )
                  ],
                ))),
      ),
    );
  }
}

int? SelectedIndex;
List<InvoiceModel> invoiceList = [];
List costDetails = [],
    costList = [],
    showDetails = [],
    editInvoiceList = [],
    userInfoList = [];
bool blanckOrNot = true;
late int editIndex;

class InvoiceModel {
  String? name, surName, category, date, dueDate;

  InvoiceModel(
      {this.name, this.surName, this.category, this.date, this.dueDate});
}
