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

  Future<void> showTestNotification() async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'test_channel',
      'Test Notifications',
      channelDescription: 'Canal para notificações de teste',
      importance: Importance.high,
      priority: Priority.high,
    );

    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidDetails);

    await flutterLocalNotificationsPlugin.show(
      0,
      'Teste de Notificação',
      'Esta é uma notificação de teste.',
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
}
