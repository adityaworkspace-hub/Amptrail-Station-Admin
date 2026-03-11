import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart' show kIsWeb;

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
    // This is just a placeholder. 
    // You need to run `flutterfire configure` to generate the real settings.
    throw UnsupportedError(
      'DefaultFirebaseOptions have not been configured for this platform - '
      'you can reconfigure this by running the FlutterFire CLI again.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBMM6Hmpo8Pqfz-i7jT8vSCVs7Epd90_O0',
    appId: '1:375034784088:web:bf9d2ebd57a428573d9d2d',
    messagingSenderId: '375034784088',
    projectId: 'amptrail31',
    authDomain: 'amptrail31.firebaseapp.com',
    storageBucket: 'amptrail31.firebasestorage.app',
    measurementId: 'G-4M8K73PCWD',
  );

}