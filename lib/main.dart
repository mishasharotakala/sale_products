import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sale_products/pages/main_page.dart';
import 'app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.dark();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My App',
      theme: theme,
      home: const MainPage(),
      //home: const Home(),
    );
  }
}
