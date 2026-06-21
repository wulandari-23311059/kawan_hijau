import 'package:flutter/material.dart';
import 'package:kawan_hijau/screens/splash_screen.dart';
import 'package:kawan_hijau/utils/app_theme.dart';

void main() {
  runApp(const KawanHijauApp());
}

class KawanHijauApp extends StatelessWidget {
  const KawanHijauApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kawan Hijau',
      theme: AppTheme.lightTheme,
      home: const SplashScreen(),
    );
  }
}