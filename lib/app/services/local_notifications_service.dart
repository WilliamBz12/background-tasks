import 'dart:io';

import 'package:background_services/app/app_widget.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class LocalNotificationsService {
  final plugin = FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    const androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const settings = InitializationSettings(
      android: androidSettings,
    );
    await plugin.initialize(
      settings,
      onDidReceiveNotificationResponse: (details) {
        navigatorKey.currentState?.pushNamed('/checklist');
        print(details.payload);
      },
    );

    tz.initializeTimeZones();
    if (Platform.isAndroid) {
      requestAndroidNotificationPermissions();
    }
  }

  void requestAndroidNotificationPermissions() async {
    final androidPlugin = plugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();

    final result = await androidPlugin?.requestExactAlarmsPermission();

    if (result == false) {
      print("Permissões não concedidas");
    }
  }

  void showNotification({
    required String title,
    required String description,
    required int id,
    String? payload,
  }) {
    final androidNotificationDetails = AndroidNotificationDetails(
      '$id',
      title,
      priority: Priority.high,
      importance: Importance.high,
    );
    plugin.show(
      id,
      title,
      description,
      NotificationDetails(android: androidNotificationDetails),
      payload: payload,
    );
  }

  void scheduleNotification({
    required String title,
    required String description,
    required int id,
    required Duration scheduleTime,
    String? payload,
  }) {
    final androidNotificationDetails = AndroidNotificationDetails(
      '$id',
      title,
      priority: Priority.high,
      importance: Importance.high,
    );
    plugin.zonedSchedule(
      id,
      title,
      description,
      tz.TZDateTime.now(tz.local).add(scheduleTime),
      NotificationDetails(android: androidNotificationDetails),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      payload: payload,
    );
  }

  void schedulePeriodicNotification({
    required String title,
    required String description,
    required int id,
    required RepeatInterval frequency,
    String? payload,
  }) {
    final androidNotificationDetails = AndroidNotificationDetails(
      '$id',
      title,
      priority: Priority.high,
      importance: Importance.high,
    );

    plugin.periodicallyShow(
      id,
      title,
      description,
      frequency,
      NotificationDetails(android: androidNotificationDetails),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      payload: payload,
    );
  }

  void cancelNotifications() async {
    await plugin.cancelAll();
  }
}
