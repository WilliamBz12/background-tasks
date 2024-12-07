import 'dart:io';

import 'package:background_services/app/services/couchbase_service.dart';
import 'package:background_services/app/utils/couchbase_constants.dart';
import 'package:cbl_flutter/cbl_flutter.dart';
import 'package:flutter/material.dart';
import 'package:workmanager/workmanager.dart';

import 'app/app_widget.dart';
import 'app/services/local_notifications_service.dart';
import 'app/services/localization_service.dart';

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask(
    (taskName, inputData) async {
      if (taskName == 'background-sync') {
        await CouchbaseLiteFlutter.init();

        final service = CouchbaseService();
        final notificationsService = LocalNotificationsService();
        await notificationsService.init();

        bool result = await service.startReplication(
          continuos: false,
          collectionName: CouchbaseContants.collection,
          onSynced: () {},
        );

        if (!result && Platform.isIOS) {
          Workmanager().registerOneOffTask(
            'retry-background-sync-id',
            'background-sync',
            initialDelay: const Duration(seconds: 15),
          );
        }

        if (result) {
          notificationsService.showNotification(
            title: 'Dados sincronizados',
            description: 'Acabamos de sincronizar os seus dados',
            id: 4,
          );
        } else {
          notificationsService.showNotification(
            description: 'Não conseguimos sincronizar seus dados',
            title: 'Erro na sincronização',
            id: 5,
          );
        }
        return result;
      } else if (taskName == 'localization-notify') {
        final localizationService = LocalizationService();

        final position = await localizationService.getLocalization();
        print('${position?.latitude}, ${position?.longitude}');
        return true;
      } else {
        print("Tarefa desconhecida");
        return true;
      }
    },
  );
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await CouchbaseLiteFlutter.init();

  final localNotificationService = LocalNotificationsService();

  localNotificationService.init();

  Workmanager().initialize(
    callbackDispatcher,
    isInDebugMode: false,
  );

  runApp(const MyApp());
}
