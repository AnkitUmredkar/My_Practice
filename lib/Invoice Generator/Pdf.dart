import 'dart:typed_data';
import 'package:modify_text/Invoice%20Generator/fill_information.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pd;
import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'details_page.dart';
import 'invoice_generator.dart';

class PdfGenerator extends StatefulWidget {
  const PdfGenerator({super.key});

  @override
  State<PdfGenerator> createState() => _PdfGeneratorState();
}

class _PdfGeneratorState extends State<PdfGenerator> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          toolbarHeight: 70,
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
          title: Text(
            'PDF Preview',
            style: TextStyle(color: Colors.white, fontSize: width * 0.05),
          ),
        ),
        body: PdfPreview(
          build: (format) => generatePdf(width, height),
        ),
      ),
    );
  }
}

Future<Uint8List> generatePdf(double width, double height) async {
  final pdf = pd.Document();
  final icon1 = await imageFromAssetBundle('assets/images/icon.png');
  pdf.addPage(
    pd.Page(
      build: (context) => pd.Column(
        crossAxisAlignment: pd.CrossAxisAlignment.center,
        children: [
          pd.Table(
            border: pd.TableBorder.all(color: PdfColors.black, width: 2),
            defaultVerticalAlignment: pd.TableCellVerticalAlignment.middle,
            columnWidths: {
              0: const pd.FixedColumnWidth(160),
              1: const pd.FixedColumnWidth(60),
            },
            children: [
              pd.TableRow(
                children: [
                  pd.Padding(
                    padding: const pd.EdgeInsets.all(24),
                    child: pd.Center(
                      child: pd.Text(
                        'INVOICE FOR PAYMENT',
                        style: pd.TextStyle(
                            fontSize: 20, fontWeight: pd.FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              ...List.generate(
                showDetails.length,
                (index) => row(showDetails[index]['costName'].text,
                    '${showDetails[index]['Cost'].text}/-', width, icon1),
              ),
              taxAndTotal('Tax', '${totalList[SelectedIndex!] * 18 / 100}/-',
                  width, icon1),
              taxAndTotal(
                  'Total',
                  '${totalList[SelectedIndex!] + totalList[SelectedIndex!] * 18 / 100}/-',
                  width,
                  icon1),
            ],
          ),
          pd.SizedBox(height: height * 0.036),
          pd.Text('THANK YOU FOR YOUR BUSINESS!',
              style: pd.TextStyle(
                  fontWeight: pd.FontWeight.bold, fontSize: width * 0.05)),
          pd.SizedBox(height: height * 0.037),
          pd.Text(
              'Please forward the below slip to your account payment department!',
              style: pd.TextStyle(
                  fontWeight: pd.FontWeight.bold, fontSize: width * 0.035)),
          pd.Divider(borderStyle: pd.BorderStyle.dashed),
          pd.SizedBox(height: height * 0.042),
          pd.Table(
            border: pd.TableBorder.all(color: PdfColors.black, width: 2),
            defaultVerticalAlignment: pd.TableCellVerticalAlignment.middle,
            children: [
              accountDetails('Account Number', '1234 1234', width, 1, icon1),
              accountDetails(
                  'Account Name', 'Adam Family Trust', width, 2, icon1),
              accountDetails(
                  'Total Amount to be Paid',
                  '${totalList[SelectedIndex!] + totalList[SelectedIndex!] * 18 / 100}/-',
                  width,
                  3,
                  icon1),
            ],
          ),
          pd.SizedBox(height: height * 0.042),
          pd.Text(
              'Please ensure all checks are payable to the ADAM FAMILY TRUST.',
              style: pd.TextStyle(
                  fontWeight: pd.FontWeight.bold,
                  fontSize: width * 0.04,
                  fontStyle: pd.FontStyle.italic)),
        ],
      ),
    ),
  );

  pdf.addPage(pd.Page(build: (context) => pd.Center()));
  return pdf.save();
}

// todo----------------------------------> All Costs
pd.TableRow row(String data, String prize, double width, var img) {
  return pd.TableRow(
    children: [
      pd.Padding(
        padding: const pd.EdgeInsets.all(10),
        child: pd.Text(
          data,
          style: pd.TextStyle(fontSize: width * 0.047),
        ),
      ),
      pd.Padding(
        padding: const pd.EdgeInsets.all(10),
        child: pd.Row(
          children: [
            pd.Image(img, height: 14),
            pd.Text(
              prize,
              style: pd.TextStyle(fontSize: width * 0.048),
            ),
          ],
        ),
      ),
    ],
  );
}

// todo----------------------------------> Total And Tax
pd.TableRow taxAndTotal(String data, String prize, double width, var img) {
  return pd.TableRow(
    children: [
      pd.Align(
        alignment: pd.Alignment.centerRight,
        child: pd.Padding(
          padding: const pd.EdgeInsets.all(10),
          child: pd.Text(
            data,
            style: pd.TextStyle(fontSize: width * 0.047),
          ),
        ),
      ),
      pd.Padding(
        padding: const pd.EdgeInsets.all(10),
        child: pd.Row(
          children: [
            pd.Image(img, height: 14),
            pd.Text(
              prize,
              style: pd.TextStyle(fontSize: width * 0.048),
            ),
          ],
        ),
      ),
    ],
  );
}

// todo----------------------------------> Accounts Details
pd.TableRow accountDetails(
    String data, String prize, double width, int check, var img) {
  return pd.TableRow(
    children: [
      pd.Padding(
        padding: const pd.EdgeInsets.all(10),
        child: pd.Text(
          data,
          style: pd.TextStyle(fontSize: width * 0.047),
        ),
      ),
      (check == 3)
          ? pd.Padding(
              padding: const pd.EdgeInsets.all(10),
              child: pd.Row(
                children: [
                  pd.Image(img, height: 14),
                  pd.Text(
                    prize,
                    style: pd.TextStyle(fontSize: width * 0.048),
                  ),
                ],
              ),
            )
          : pd.Padding(
              padding: const pd.EdgeInsets.all(10),
              child: pd.Text(
                prize,
                style: pd.TextStyle(fontSize: width * 0.047),
              ),
            ),
    ],
  );
}
