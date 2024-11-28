import 'dart:io';

import 'package:background_services/app/services/couchbase_service.dart';
import 'package:cbl_flutter/cbl_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:workmanager/workmanager.dart';

import 'app/app_widget.dart';
import 'app/utils/couchbase_constants.dart';

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    final userId = inputData?['userId'];
    print("Executando tarefa com userId: $userId");
    final service = CouchbaseService();

    if (task == 'couchbaseSync') {
      bool synced = false;
      await service.startReplication(
        collectionName: CouchbaseContants.collection,
        onSynced: () {
          synced = true;
        },
      );

      if (!synced && Platform.isIOS) {
        Workmanager().registerOneOffTask(
          "retryTask",
          "retrySyncExecution",
        );
      }
      return Future.value(synced);
    } else if (task == 'retrySyncExecution') {
      await service.startReplication(
        collectionName: CouchbaseContants.collection,
        onSynced: () {},
      );
      return Future.value(true);
    } else {
      return Future.value(true);
    }
  });
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load();

  await CouchbaseLiteFlutter.init();

  Workmanager().initialize(callbackDispatcher, isInDebugMode: true);

  runApp(const MyApp());
}
