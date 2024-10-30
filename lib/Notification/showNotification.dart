import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

class ShowNotification extends StatefulWidget {
  const ShowNotification({super.key});

  @override
  State<ShowNotification> createState() => _ShowNotificationState();
}

class _ShowNotificationState extends State<ShowNotification> {
  @override
  void initState() {
    AwesomeNotifications().isNotificationAllowed().then(
      (isAllowed) {
        if (!isAllowed) {
          AwesomeNotifications().requestPermissionToSendNotifications();
        }
      },
    );
    super.initState();
  }

  void triggerNotification() {
    AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: 10,
            channelKey: 'basic_channel',
            title: 'Simple Notification',
            body: 'Hello, my name is ankit and i am Full Stack App developer'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example of notification'),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: triggerNotification,
            child: const Text('Click here to see notification')),
      ),
    );
  }
}
