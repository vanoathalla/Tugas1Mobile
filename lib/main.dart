// import 'package:flutter/material.dart';
// import 'screens/login_page.dart';
// import 'screens/dashboard_page.dart';
// import 'screens/kelompok_page.dart';
// import 'screens/kalkulator_page.dart';
// import 'screens/bilangan_page.dart';
// import 'screens/jumlah_field_page.dart';
// import 'screens/stopwatch_page.dart';
// import 'screens/piramid_page.dart';

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
      title: 'Tugas Mobile Kalcer',
      // Style dibikin polosan ngikutin default Flutter (gaya aslab)
      theme: ThemeData(colorScheme: const ColorScheme.light()),
      // Navigasi awal langsung tembak ke LoginPage
      home: const LoginPage(),
    );
  }
}
