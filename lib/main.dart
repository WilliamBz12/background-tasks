import 'package:cbl_flutter/cbl_flutter.dart';
import 'package:flutter/material.dart';

import 'app/app_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await CouchbaseLiteFlutter.init();

  runApp(const MyApp());
}
