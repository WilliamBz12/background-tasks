import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class LocalNotificatoinService {
  static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> initialize() async {
    const AndroidInitializationSettings androidInitSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initSettings = InitializationSettings(
      android: androidInitSettings,
    );

    await flutterLocalNotificationsPlugin.initialize(initSettings);
  }

  Future<void> showNotification({
    required String title,
    required String description,
    required int id,
    required String channel,
  }) async {
    final AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      channel,
      'Test Notifications',
      channelDescription: 'Canal para notificações de teste',
      importance: Importance.high,
      priority: Priority.high,
    );

    final NotificationDetails notificationDetails =
        NotificationDetails(android: androidDetails);

    await flutterLocalNotificationsPlugin.show(
      id,
      title,
      description,
      notificationDetails,
    );
  }

  Future<void> scheduleNotification({
    required String title,
    required String description,
    required int id,
    required String channel,
    required Duration scheduleTime,
  }) async {
    final alreadySchedule = await notificationAlreadySchedule(id);

    if (alreadySchedule) {
      return;
    }

    final AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      channel,
      'Scheduled Notifications',
      channelDescription: 'Notificações agendadas',
      importance: Importance.high,
      priority: Priority.high,
    );

    final NotificationDetails notificationDetails =
        NotificationDetails(android: androidDetails);

    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      description,
      tz.TZDateTime.now(tz.local).add(scheduleTime),
      notificationDetails,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  Future<void> schedulePeriodicNotification({
    required String title,
    required String description,
    required int id,
    required String channel,
    required RepeatInterval repeatInterval,
  }) async {
    final alreadySchedule = await notificationAlreadySchedule(id);

    if (alreadySchedule) {
      return;
    }

    final AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      channel,
      'Periodic Notifications',
      channelDescription: 'Notificações periódicas',
      importance: Importance.high,
      priority: Priority.high,
    );

    final NotificationDetails notificationDetails =
        NotificationDetails(android: androidDetails);

    await flutterLocalNotificationsPlugin.periodicallyShow(
      id,
      title,
      description,
      repeatInterval,
      notificationDetails,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
    );
  }

  Future<bool> notificationAlreadySchedule(int notificationId) async {
    final items =
        await flutterLocalNotificationsPlugin.pendingNotificationRequests();
    return items.any((e) => e.id == notificationId);
  }
}
