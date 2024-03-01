import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intention_for_today/app/injection_container.dart';
import 'package:intention_for_today/app/root_page.dart';
import 'package:intention_for_today/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  configureDependencies();
  runApp(const MyApp());
}
