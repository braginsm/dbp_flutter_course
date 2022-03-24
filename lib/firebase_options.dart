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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
    }
    // ignore: missing_enum_constant_in_switch
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCbKfz3zK7zmYPz9T3aOGgMVwb9fq7rDSo',
    appId: '1:818578207506:android:496aa6d4093dfb922179cb',
    messagingSenderId: '818578207506',
    projectId: 'dbp-flutter-course',
    storageBucket: 'dbp-flutter-course.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDUX-K3maoFU81lCLYJ5VYnnrYk0qa5rR8',
    appId: '1:818578207506:ios:ed677a3369954d8d2179cb',
    messagingSenderId: '818578207506',
    projectId: 'dbp-flutter-course',
    storageBucket: 'dbp-flutter-course.appspot.com',
    iosClientId:
        '818578207506-j651uo5hh3i7b9ku0nafhodush667u30.apps.googleusercontent.com',
    iosBundleId: 'com.example.dbpFlutterCourse',
  );
}
