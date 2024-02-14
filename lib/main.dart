import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intention_for_today/app/app.dart';
import 'package:intention_for_today/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}
