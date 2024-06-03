import 'dart:typed_data';
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
    return SafeArea(
      child: Scaffold(
        body: PdfPreview(
          build: (format) => generatePdf(),
        ),
      ),
    );
  }
}

Future<Uint8List> generatePdf() {
  final pdf = pd.Document();
  pdf.addPage(pd.Page(
    build: (context) => pd.Center(
      child: pd.Table(
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
                padding: const pd.EdgeInsets.all(20),
                child: pd.Center(
                  child: pd.Text(
                    'Invoice For Payment',
                    style: pd.TextStyle(
                        fontSize: 23, fontWeight: pd.FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
          row('Technical Engagement', 120),
          row('Deployment Assistance', 200)
        ],
      ),
    ),
  ));
  return pdf.save();
}

pd.TableRow row(String data, int prize) {
  return pd.TableRow(
    children: [
      pd.Padding(
        padding: const pd.EdgeInsets.all(10),
        child: pd.Text(
          data,
          style: const pd.TextStyle(fontSize: 18),
        ),
      ),
      pd.Padding(
        padding: const pd.EdgeInsets.all(10),
        child: pd.Text(
          prize.toString(),
          style: const pd.TextStyle(fontSize: 18),
        ),
      ),
    ],
  );
}
