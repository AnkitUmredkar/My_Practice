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
        // backgroundColor: Color(0xff262729),
        appBar: AppBar(
          leading: const Icon(
            Icons.menu,
            color: Colors.white,
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width : width / 1.2,
                      child: ListTile(
                        title: Text(
                          '${invoiceList[index].category}',
                          style: TextStyle(
                              fontSize: width * 0.041, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text('${invoiceList[index].name} ${invoiceList[index].surName}',
                            style: TextStyle(
                                fontSize: width * 0.041,
                                color: Colors.black54,
                                fontWeight: FontWeight.bold)),
                        trailing: Text('${totalList[index]}',
                            style: TextStyle(fontSize: width * 0.041)),
                      ),
                    ),
                    // IconButton(onPressed: (){
                    //   setState(() {
                    //     SelectedIndex = index;
                    //     editOrNew = true;
                    //   });
                    //     print(index);
                    //   Navigator.of(context).pushNamed('/FillDetails');
                    // },icon:const Icon(Icons.edit),color: Colors.black,),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: GestureDetector(
            onTap: () {
              txtCost = TextEditingController();
              txtCostName = TextEditingController();
              costDetails = [
                {'costName': txtCostName, 'Cost': txtCost}
              ];
              txtDate= TextEditingController();
              txtDueDate= TextEditingController();
              txtName= TextEditingController();
              txtSurName= TextEditingController();
              txtCategory= TextEditingController();
              editOrNew = false;
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const FillDetails()));
            },
            child: Container(
              width: width * 0.925 ,
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                    color: Colors.blue),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      color: Colors.white,
                      size: width * 0.06,
                    ),
                    Text(' New Invoice',style: TextStyle(color: Colors.white,fontSize: width * 0.04),)
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
bool editOrNew = false;
late int editIndex;

class InvoiceModel {
  String? name, surName, category,date,dueDate;

  InvoiceModel({this.name, this.surName, this.category, this.date,this.dueDate});
}
