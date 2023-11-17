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
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCuohr6FuRYvqD4OPxzO1B0DSoovRogUwg',
    appId: '1:14820798359:web:d3412747d7457a752f9ed2',
    messagingSenderId: '14820798359',
    projectId: 'eden-d5ed4',
    authDomain: 'eden-d5ed4.firebaseapp.com',
    storageBucket: 'eden-d5ed4.appspot.com',
    measurementId: 'G-2VERPZDW7Z',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCF3YiVGNgh9MM4mMBb2OPLm2e6uaRy9rM',
    appId: '1:14820798359:android:a25c772a02cb68cd2f9ed2',
    messagingSenderId: '14820798359',
    projectId: 'eden-d5ed4',
    storageBucket: 'eden-d5ed4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBB_6BCVtDbaDaoPCOlrPtvxtxroXLAyn8',
    appId: '1:14820798359:ios:a1a2038d1e65bfb52f9ed2',
    messagingSenderId: '14820798359',
    projectId: 'eden-d5ed4',
    storageBucket: 'eden-d5ed4.appspot.com',
    iosClientId: '14820798359-jj66pcg1c5k8kc15v86hu6l6vfrs3fqf.apps.googleusercontent.com',
    iosBundleId: 'com.edenlife.eden',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBB_6BCVtDbaDaoPCOlrPtvxtxroXLAyn8',
    appId: '1:14820798359:ios:b72bbc0d096eec152f9ed2',
    messagingSenderId: '14820798359',
    projectId: 'eden-d5ed4',
    storageBucket: 'eden-d5ed4.appspot.com',
    iosClientId: '14820798359-9ni3bifg9m7pn4kburhr7oallcab6599.apps.googleusercontent.com',
    iosBundleId: 'com.edenlife.eden.RunnerTests',
  );
}