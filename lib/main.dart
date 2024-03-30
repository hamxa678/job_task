import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'app.dart';
import 'core/enums/env.dart';
import 'core/others/logger_customizations/custom_logger.dart';
import 'firebase_options.dart';
import 'locator.dart';

Future<void> main() async {
  final log = CustomLogger(className: 'main');
  try {
    log.i('Testing info logs');
    log.d('Testing debug logs');
    log.e('Testing error logs');
    log.f('Testing WTF logs');
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      name: 'Job_Application',
      options: DefaultFirebaseOptions.currentPlatform,
    );
    // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    await setupLocator(Env.production);
    runApp(const MyApp(title: 'App Name'));
  } catch (e) {
    log.e("$e");
  }
}

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   final log = Logger();
//   await Firebase.initializeApp();
//   log.d("Handling a background message: ${message.messageId}");
// }
