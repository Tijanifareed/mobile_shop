// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyCnIeIlfIi8KiqLJY3CLhSYgX_GWtlcdjY',
    appId: '1:516976619973:web:991679bcd101b007831bac',
    messagingSenderId: '516976619973',
    projectId: 'shoppingapp-dd1b8',
    authDomain: 'shoppingapp-dd1b8.firebaseapp.com',
    storageBucket: 'shoppingapp-dd1b8.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyClFwFeFb9d6hiWGZpcEJ9GvNNPPmET4iI',
    appId: '1:516976619973:android:47fb76907f14f487831bac',
    messagingSenderId: '516976619973',
    projectId: 'shoppingapp-dd1b8',
    storageBucket: 'shoppingapp-dd1b8.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCJxuA-iLo8e6jvdfmE-jmPDuO8u5unbOQ',
    appId: '1:516976619973:ios:ea1a15d8a25e7d74831bac',
    messagingSenderId: '516976619973',
    projectId: 'shoppingapp-dd1b8',
    storageBucket: 'shoppingapp-dd1b8.firebasestorage.app',
    iosBundleId: 'com.example.onlineMarket',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCJxuA-iLo8e6jvdfmE-jmPDuO8u5unbOQ',
    appId: '1:516976619973:ios:ea1a15d8a25e7d74831bac',
    messagingSenderId: '516976619973',
    projectId: 'shoppingapp-dd1b8',
    storageBucket: 'shoppingapp-dd1b8.firebasestorage.app',
    iosBundleId: 'com.example.onlineMarket',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCnIeIlfIi8KiqLJY3CLhSYgX_GWtlcdjY',
    appId: '1:516976619973:web:974b1f480d2f07c7831bac',
    messagingSenderId: '516976619973',
    projectId: 'shoppingapp-dd1b8',
    authDomain: 'shoppingapp-dd1b8.firebaseapp.com',
    storageBucket: 'shoppingapp-dd1b8.firebasestorage.app',
  );
}
