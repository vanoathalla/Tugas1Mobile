import 'package:flutter/material.dart';
import 'views/login_page.dart';

void main() {
  runApp(const TugasMobileApp());
}

class TugasMobileApp extends StatelessWidget {
  const TugasMobileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tugas Mobile 1',
      theme: ThemeData(colorScheme: const ColorScheme.light()),
      home: const LoginPage(),
    );
  }
}
