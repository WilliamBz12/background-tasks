import 'package:flutter_dotenv/flutter_dotenv.dart';

class CouchbaseContants {
  static String userName = dotenv.get('USER_NAME');
  static String password = dotenv.get('USER_PASSWORD');
  static String publicConnectionUrl = dotenv.get('PUBLIC_CONNECTION_URL');

  static const String channel = 'checklist_items';
  static const String collection = 'checklist_items';
  static const String scope = 'app_scope';
}
