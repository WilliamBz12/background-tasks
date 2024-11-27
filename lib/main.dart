import 'package:cbl_flutter/cbl_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:workmanager/workmanager.dart';

import 'app/app_widget.dart';

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) {
    print("Tarefa em background executada: $task");
    return Future.value(true);
  });
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load();

  await CouchbaseLiteFlutter.init();

  Workmanager().initialize(callbackDispatcher, isInDebugMode: true);

  runApp(const MyApp());
}
