import 'package:background_services/app/services/couchbase_service.dart';
import 'package:background_services/app/utils/couchbase_constants.dart';
import 'package:cbl_flutter/cbl_flutter.dart';
import 'package:flutter/material.dart';
import 'package:workmanager/workmanager.dart';

import 'app/app_widget.dart';

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask(
    (taskName, inputData) async {
      if (taskName == 'background-sync') {
        await CouchbaseLiteFlutter.init();

        final service = CouchbaseService();

        bool result = await service.startReplication(
          continuos: false,
          collectionName: CouchbaseContants.collection,
          onSynced: () {},
        );
        return result;
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

  Workmanager().initialize(
    callbackDispatcher,
    isInDebugMode: true,
  );

  runApp(const MyApp());
}
