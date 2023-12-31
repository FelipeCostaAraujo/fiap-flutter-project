// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAv7r6whp5lZkPITEbTQsMvVSmpCn-Apj0',
    appId: '1:19060756646:web:2fce80e40ba18d561d6467',
    messagingSenderId: '19060756646',
    projectId: 'fiap-mobr',
    authDomain: 'fiap-mobr.firebaseapp.com',
    storageBucket: 'fiap-mobr.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBDCmYqJc3OWeAa6BT3OaHSnjbFwicLFqk',
    appId: '1:19060756646:android:398b4e7835576abf1d6467',
    messagingSenderId: '19060756646',
    projectId: 'fiap-mobr',
    storageBucket: 'fiap-mobr.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDWx3n3cf7_NJxcaA33Cfgq9HxN85V7O4k',
    appId: '1:19060756646:ios:646a4fb67c1678341d6467',
    messagingSenderId: '19060756646',
    projectId: 'fiap-mobr',
    storageBucket: 'fiap-mobr.appspot.com',
    iosClientId:
        '19060756646-gp42oetgr76kj014fagh69n49nt3eoot.apps.googleusercontent.com',
    iosBundleId: 'com.example.mobr1',
  );
}
