//
// Generated file. Do not edit.
// This file is generated from template in file `flutter_tools/lib/src/flutter_plugins.dart`.
//

// @dart = 3.5

import 'dart:io'; // flutter_ignore: dart_io_import.
import 'package:cbl_flutter_ce/cbl_flutter_ce.dart';
import 'package:path_provider_android/path_provider_android.dart';
import 'package:cbl_flutter_ce/cbl_flutter_ce.dart';
import 'package:path_provider_foundation/path_provider_foundation.dart';
import 'package:cbl_flutter_ce/cbl_flutter_ce.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:path_provider_linux/path_provider_linux.dart';
import 'package:cbl_flutter_ce/cbl_flutter_ce.dart';
import 'package:path_provider_foundation/path_provider_foundation.dart';
import 'package:cbl_flutter_ce/cbl_flutter_ce.dart';
import 'package:path_provider_windows/path_provider_windows.dart';

@pragma('vm:entry-point')
class _PluginRegistrant {

  @pragma('vm:entry-point')
  static void register() {
    if (Platform.isAndroid) {
      try {
        CblFlutterCe.registerWith();
      } catch (err) {
        print(
          '`cbl_flutter_ce` threw an error: $err. '
          'The app may not function as expected until you remove this plugin from pubspec.yaml'
        );
      }

      try {
        PathProviderAndroid.registerWith();
      } catch (err) {
        print(
          '`path_provider_android` threw an error: $err. '
          'The app may not function as expected until you remove this plugin from pubspec.yaml'
        );
      }

    } else if (Platform.isIOS) {
      try {
        CblFlutterCe.registerWith();
      } catch (err) {
        print(
          '`cbl_flutter_ce` threw an error: $err. '
          'The app may not function as expected until you remove this plugin from pubspec.yaml'
        );
      }

      try {
        PathProviderFoundation.registerWith();
      } catch (err) {
        print(
          '`path_provider_foundation` threw an error: $err. '
          'The app may not function as expected until you remove this plugin from pubspec.yaml'
        );
      }

    } else if (Platform.isLinux) {
      try {
        CblFlutterCe.registerWith();
      } catch (err) {
        print(
          '`cbl_flutter_ce` threw an error: $err. '
          'The app may not function as expected until you remove this plugin from pubspec.yaml'
        );
      }

      try {
        ConnectivityPlusLinuxPlugin.registerWith();
      } catch (err) {
        print(
          '`connectivity_plus` threw an error: $err. '
          'The app may not function as expected until you remove this plugin from pubspec.yaml'
        );
      }

      try {
        PathProviderLinux.registerWith();
      } catch (err) {
        print(
          '`path_provider_linux` threw an error: $err. '
          'The app may not function as expected until you remove this plugin from pubspec.yaml'
        );
      }

    } else if (Platform.isMacOS) {
      try {
        CblFlutterCe.registerWith();
      } catch (err) {
        print(
          '`cbl_flutter_ce` threw an error: $err. '
          'The app may not function as expected until you remove this plugin from pubspec.yaml'
        );
      }

      try {
        PathProviderFoundation.registerWith();
      } catch (err) {
        print(
          '`path_provider_foundation` threw an error: $err. '
          'The app may not function as expected until you remove this plugin from pubspec.yaml'
        );
      }

    } else if (Platform.isWindows) {
      try {
        CblFlutterCe.registerWith();
      } catch (err) {
        print(
          '`cbl_flutter_ce` threw an error: $err. '
          'The app may not function as expected until you remove this plugin from pubspec.yaml'
        );
      }

      try {
        PathProviderWindows.registerWith();
      } catch (err) {
        print(
          '`path_provider_windows` threw an error: $err. '
          'The app may not function as expected until you remove this plugin from pubspec.yaml'
        );
      }

    }
  }
}
