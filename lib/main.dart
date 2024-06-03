import 'package:flutter/material.dart';
import 'package:modify_text/ListView_ListTile/List_view.dart';
import 'Current_Date_Time/Date_Time_Picker.dart';
import 'Invoice Generator/Pdf.dart';
import 'Invoice Generator/details_page.dart';
import 'Invoice Generator/fill_information.dart';
import 'Invoice Generator/invoice_generator.dart';
import 'Table/tableExample.dart';
import 'Tic_Tac_Toe/tic_tac.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //TODO Tic_Tac_Toe Game
      // home: TicTacToeFirstPage(),

      //TODO Table Example
      // home: tableExample(),

      //TODO Invoice Generator
      routes: {
        '/': (context) => const InvoiceGenerator(),
        '/FillDetails': (context) => const FillDetails(),
        '/DetailsPage': (context) => const DetailsPage(),
        '/pdf': (context) => const PdfGenerator(),
      }
    );
  }
}

