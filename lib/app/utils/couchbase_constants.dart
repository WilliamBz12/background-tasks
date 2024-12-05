class CouchbaseContants {
  static String userName = const String.fromEnvironment('USER_NAME');
  static String password = const String.fromEnvironment('USER_PASSWORD');
  static String publicConnectionUrl =
      const String.fromEnvironment('PUBLIC_CONNECTION_URL');

  static const String channel = 'checklist_items';
  static const String collection = 'checklist_items';
  static const String scope = 'app_scope';
}
