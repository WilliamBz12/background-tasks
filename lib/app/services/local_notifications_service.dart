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
}
