import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:modify_text/Animations/shader_mask.dart';
import 'Animations/AnimatedSwitcher.dart';
import 'Animations/animatedList.dart';
import 'Animations/animated_like_button.dart';
import 'Animations/animated_size.dart';
import 'Animations/animation_controller.dart';
import 'Animations/backdrop_filter.dart';
import 'Animations/custom_scrollview.dart';
import 'Animations/dismissable.dart';
import 'Animations/draggable_scrollable_sheet.dart';
import 'Animations/expansion_pan_list.dart';
import 'Animations/expansion_tile.dart';
import 'Animations/layout_builder.dart';
import 'Animations/orientation_builcer.dart';
import 'Animations/scroll_controller.dart';

void main() {
  AwesomeNotifications().initialize(null, [
    NotificationChannel(
        channelKey: 'basic_channel',
        channelName: 'Basic Notification',
        channelDescription: 'Notification channel for basic test'),
  ],
    debug: true,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      //TODO Snack Game
      // theme: ThemeData.dark(),
      home: AnimatedLikeButtonEx(),
      //TODO Tic_Tac_Toe Game
      // home: TicTacToeFirstPage(),

      //TODO Play Sound
      // home: PlaySound(),

      //TODO DateTimePicker
      // home: DateTimeFromCalender(),

      //TODO Table Example
      // home: tableExample(),

      //TODO Invoice Generator
      // routes: {
      //   '/': (context) => const SplashScreen(),
      //   '/HomePage': (context) => const InvoiceGenerator(),
      //   '/FillDetails': (context) => const FillDetails(),
      //   '/DetailsPage': (context) => const DetailsPage(),
      //   '/EditInformation': (context) => const EditInformation(),
      //   '/pdf': (context) => const PdfGenerator(),
      // }
    );
  }
}
