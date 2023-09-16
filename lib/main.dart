import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:luvit/firebase_options.dart';
import 'package:luvit/providers/providers.dart';
import 'package:luvit/screens/screens.dart';
import 'package:provider/provider.dart';

void main() async {
  // Run App
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    // Init Firebase
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    runApp(
      StreamProvider<Object?>(
        create: (context) => DatabaseProvider().fetchDataStreamByRef(),
        initialData: const {},
        child: const MyApp(),
      ),
    );
  }, (error, stack) {});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Luvit',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const Base(),
    );
  }
}
