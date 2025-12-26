import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'pages/splash_screen_page.dart';

void main() {
  runApp(const PanduApp());
}

class PanduApp extends StatelessWidget {
  const PanduApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pandu LMS',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const SplashScreenPage(),
    );
  }
}
