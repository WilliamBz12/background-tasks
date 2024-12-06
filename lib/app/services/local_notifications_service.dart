import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationsService {
  final plugin = FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    const androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const settings = InitializationSettings(
      android: androidSettings,
    );
    await plugin.initialize(settings);
  }

  void showNotification() {
    const androidNotificationDetails = AndroidNotificationDetails(
      'test-id',
      'Teste',
      priority: Priority.high,
      importance: Importance.high,
    );
    plugin.show(
      1,
      'Notificação de teste',
      'Descrição de teste',
      const NotificationDetails(android: androidNotificationDetails),
    );
  }
}
