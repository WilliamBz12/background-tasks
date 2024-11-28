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
    final service = CouchbaseService();
    bool synced = false;
    await service.startReplication(
      collectionName: CouchbaseContants.collection,
      onSynced: () {
        synced = true;
      },
    );
    return Future.value(synced);
  });
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load();

  await CouchbaseLiteFlutter.init();

  Workmanager().initialize(callbackDispatcher, isInDebugMode: true);

  runApp(const MyApp());
}
