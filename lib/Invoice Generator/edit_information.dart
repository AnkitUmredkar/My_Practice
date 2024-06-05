import 'package:flutter/material.dart';

import 'fill_information.dart';
import 'invoice_generator.dart';

class EditInformation extends StatefulWidget {
  const EditInformation({super.key});

  @override
  State<EditInformation> createState() => _EditInformationState();
}

class _EditInformationState extends State<EditInformation> {
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
            'Edit Invoice',
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
                  //todo------------------------> Name,SurName And Category
                  Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Fill Below Details",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        const SizedBox(height: 12),
                        TextFormField(
                          cursorColor: const Color(0xff0174ec),
                          style: const TextStyle(color: Colors.white),
                          textInputAction: TextInputAction.next,
                          controller: txtName,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Field Must Be Required';
                            }
                          },
                          decoration: InputDecoration(
                              labelStyle:
                                  const TextStyle(color: Colors.white70),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Color(0xff0174ec),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              label: const Text('First Name')),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 20, bottom: 20),
                          child: TextFormField(
                            cursorColor: const Color(0xff0174ec),
                            style: const TextStyle(color: Colors.white),
                            textInputAction: TextInputAction.next,
                            controller: txtSurName,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Field Must Be Required';
                              }
                            },
                            decoration: InputDecoration(
                                labelStyle:
                                    const TextStyle(color: Colors.white70),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0xff0174ec),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                label: const Text('Last Name')),
                          ),
                        ),
                        TextFormField(
                          cursorColor: const Color(0xff0174ec),
                          style: const TextStyle(color: Colors.white),
                          textInputAction: TextInputAction.next,
                          controller: txtCategory,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Field Must Be Required';
                            }
                          },
                          decoration: InputDecoration(
                            labelStyle: const TextStyle(color: Colors.white70),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xff0174ec),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
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
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            setState(() async {
                              DateTime? datePicked = await showDatePicker(
                                  barrierColor: Colors.black54,
                                  context: context,
                                  firstDate: DateTime(1900),
                                  initialDate: DateTime.now(),
                                  lastDate: DateTime.now());
                              if (datePicked != null) {
                                date =
                                    '${datePicked.day}/${datePicked.month}/${datePicked.year}';
                                txtDate.text = date;
                              }
                            });
                          },
                          child: AbsorbPointer(
                            absorbing: true,
                            child: TextFormField(
                              cursorColor: const Color(0xff0174ec),
                              style: const TextStyle(color: Colors.white),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Field Must be Required!';
                                }
                              },
                              controller: txtDate,
                              autofocus: false,
                              decoration: InputDecoration(
                                labelStyle:
                                    const TextStyle(color: Colors.white70),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0xff0174ec),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                label: const Text('Announce Date'),
                                hintText: 'Announce Date',
                                // enabledBorder: buildOutlineInputBorder(1),
                                // focusedBorder: buildOutlineInputBorder(2),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            setState(() async {
                              DateTime? datePicked = await showDatePicker(
                                  barrierDismissible: false,
                                  barrierColor: Colors.black54,
                                  context: context,
                                  firstDate: DateTime.now(),
                                  initialDate: DateTime.now(),
                                  lastDate: DateTime(2025));
                              if (datePicked != null) {
                                dueDate =
                                    '${datePicked.day}/${datePicked.month}/${datePicked.year}';
                                txtDueDate.text = dueDate;
                              }
                            });
                          },
                          child: AbsorbPointer(
                            absorbing: true,
                            child: TextFormField(
                              cursorColor: const Color(0xff0174ec),
                              style: const TextStyle(color: Colors.white),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Field Must be Required!';
                                }
                              },
                              controller: txtDueDate,
                              autofocus: false,
                              decoration: InputDecoration(
                                labelStyle:
                                    const TextStyle(color: Colors.white70),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Color(0xff0174ec),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                label: const Text('Due Date'),
                                hintText: 'Due Date',
                                // enabledBorder: buildOutlineInputBorder(1),
                                // focusedBorder: buildOutlineInputBorder(2),
                              ),
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
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Text(
                              "Enter Cost ",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  txtCost = TextEditingController();
                                  txtCostName = TextEditingController();
                                  editInvoiceList.add({
                                    'costName': txtCostName,
                                    'Cost': txtCost
                                  });
                                });
                              },
                              icon: const Icon(
                                Icons.add,
                                size: 30,
                                color: Colors.white,
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
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        ...List.generate(
                          editInvoiceList.length,
                          (index) => Row(
                            children: [
                              Container(
                                width: width * 0.45,
                                margin: EdgeInsets.only(bottom: height * 0.03),
                                child: TextFormField(
                                  cursorColor: const Color(0xff0174ec),
                                  style: const TextStyle(color: Colors.white),
                                  textInputAction: TextInputAction.next,
                                  controller: editInvoiceList[index]
                                      ['costName'],
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Field Must Be Required';
                                    }
                                  },
                                  decoration: InputDecoration(
                                      labelStyle: const TextStyle(
                                          color: Colors.white70),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xff0174ec),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
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
                                  cursorColor: const Color(0xff0174ec),
                                  style: const TextStyle(color: Colors.white),
                                  textInputAction: TextInputAction.next,
                                  keyboardType: TextInputType.number,
                                  controller: editInvoiceList[index]['Cost'],
                                  validator: (value) {
                                    bool ck = false;
                                    if (value!.isEmpty) {
                                      return 'Field Must Be Required';
                                    }
                                    for (int i = 0; i < value.length; i++) {
                                      int charCode = value.codeUnitAt(i);
                                      if (!(charCode >= 48 && charCode <= 57)) {
                                        ck = true;
                                      }
                                    }
                                    if (ck) {
                                      return 'String is not Allow in this Field';
                                    }
                                  },
                                  decoration: InputDecoration(
                                      labelStyle: const TextStyle(
                                          color: Colors.white70),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0xff0174ec),
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
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
                            invoiceList[editIndex].name = txtName.text;
                            invoiceList[editIndex].surName = txtSurName.text;
                            invoiceList[editIndex].category = txtCategory.text;
                            invoiceList[editIndex].date = txtDate.text;
                            invoiceList[editIndex].dueDate = txtDueDate.text;
                            costList[editIndex] = editInvoiceList;
                            total = 0;
                            for (int i = 0; i < editInvoiceList.length; i++) {
                              total = total +
                                  int.parse(editInvoiceList[i]['Cost'].text);
                            }
                            totalList[editIndex] = total.toDouble();
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const InvoiceGenerator(),
                              ),
                            );
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
      ),
    );
  }
}
