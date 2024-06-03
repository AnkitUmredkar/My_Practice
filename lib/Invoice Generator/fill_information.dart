import 'package:flutter/material.dart';
import 'invoice_generator.dart';

class FillDetails extends StatefulWidget {
  const FillDetails({super.key});

  @override
  State<FillDetails> createState() => _FillDetailsState();
}

class _FillDetailsState extends State<FillDetails> {
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
          'Fill Details',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                //todo------------------------> Name And Category
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Enter Name and Category",
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        textInputAction: TextInputAction.next,
                        controller: txtName,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Field Must Be Required';
                          }
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.grey,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            label: const Text('User Name')),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: TextFormField(
                          textInputAction: TextInputAction.next,
                          controller: txtCategory,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Field Must Be Required';
                            }
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.grey,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            label: const Text('Type of Expense'),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                    ],
                  ),
                ),
                //todo------------------------> CostName And Cost
                Container(
                  margin: EdgeInsets.only(top: height * 0.03),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    border: Border.all(),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text(
                            "Enter Cost ",
                            style: TextStyle(fontSize: 20),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                txtCost = TextEditingController();
                                txtCostName = TextEditingController();
                                costDetails.add(
                                    {'costName': txtCostName, 'Cost': txtCost});
                              });
                            },
                            icon: const Icon(
                              Icons.add,
                              size: 30,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                costDetails.removeLast();
                              });
                            },
                            icon: const Icon(
                              Icons.delete,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      ...List.generate(
                        costDetails.length,
                        (index) => Row(
                          children: [
                            Container(
                              width: width * 0.45,
                              margin: EdgeInsets.only(bottom: height * 0.03),
                              child: TextFormField(
                                textInputAction: TextInputAction.next,
                                controller: costDetails[index]['costName'],
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Field Must Be Required';
                                  }
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.grey,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    label: const Text('Expense Name')),
                              ),
                            ),
                            const Spacer(),
                            Container(
                              margin: EdgeInsets.only(bottom: height * 0.03),
                              width: width * 0.35,
                              child: TextFormField(
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.number,
                                controller: costDetails[index]['Cost'],
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Field Must Be Required';
                                  }
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.grey,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    label: const Text('Cost')),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                //todo--------------------------------> OK Button
                Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        if (formkey.currentState!.validate()) {
                          invoiceList.add(
                            InvoiceModel(
                              name: txtName.text,
                              category: txtCategory.text,
                            ),
                          );
                          costList.add(costDetails);
                          total = 0;
                          for (int i = 0; i < costDetails.length; i++) {
                            int subtotal =
                                int.parse(costDetails[i]['Cost'].text);
                            total = total + subtotal;
                          }
                          totalList.add(total.toDouble());
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const InvoiceGenerator()));
                          txtName.clear();
                          txtCategory.clear();
                        }
                      });
                    },
                    child: const Text(
                      'OK',
                      style: TextStyle(color: Colors.blue, fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

int total = 0;
List totalList = [];
