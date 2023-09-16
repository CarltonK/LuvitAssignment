import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyCAYvB3Bs2M38-97IMIjuo6nGlGyPn4Mxw',
    appId: '1:393917891206:web:2294300f70b12eec830707',
    messagingSenderId: '393917891206',
    projectId: 'assinmentluvit',
    authDomain: 'assinmentluvit.firebaseapp.com',
    databaseURL:
        'https://assinmentluvit-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'assinmentluvit.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAJdC4if018qA1dCZKYu4XxTS5CGGvlOBs',
    appId: '1:393917891206:android:9481d34cc05a4807830707',
    messagingSenderId: '393917891206',
    projectId: 'assinmentluvit',
    databaseURL:
        'https://assinmentluvit-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'assinmentluvit.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDMnOE-vAQu0zRWyblChfd2z6VPRxeuI0U',
    appId: '1:393917891206:ios:f300cc3b95f2efdb830707',
    messagingSenderId: '393917891206',
    projectId: 'assinmentluvit',
    databaseURL:
        'https://assinmentluvit-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'assinmentluvit.appspot.com',
    iosClientId:
        '393917891206-q3ppblnva85cp6eggr0hs6vgjg13hpfi.apps.googleusercontent.com',
    iosBundleId: 'com.example.luvit',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDMnOE-vAQu0zRWyblChfd2z6VPRxeuI0U',
    appId: '1:393917891206:ios:1613774694cd2135830707',
    messagingSenderId: '393917891206',
    projectId: 'assinmentluvit',
    databaseURL:
        'https://assinmentluvit-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'assinmentluvit.appspot.com',
    iosClientId:
        '393917891206-6h9innvhaalmfmvhpkfj7jsq3vqrv9bk.apps.googleusercontent.com',
    iosBundleId: 'com.example.luvit.RunnerTests',
  );
}
