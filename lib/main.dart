import 'package:flutter/material.dart';
import 'package:quiz_app/app.dart';
import 'package:quiz_app/core/di/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(const MyApp());
}
