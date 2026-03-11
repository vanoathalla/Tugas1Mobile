import 'package:flutter/material.dart';
import 'screens/login_page.dart';
import 'screens/dashboard_page.dart';
import 'screens/kelompok_page.dart';
import 'screens/kalkulator_page.dart';
import 'screens/bilangan_page.dart';
import 'screens/jumlah_field_page.dart';
import 'screens/stopwatch_page.dart';
import 'screens/piramid_page.dart';

void main() {
  runApp(const TugasMobileApp());
}

class TugasMobileApp extends StatelessWidget {
  const TugasMobileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tugas Mobile',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      // Halaman pertama yang dibuka pas app jalan
      initialRoute: '/',
      // Daftar rute halamannye
      routes: {
        '/': (context) => const LoginPage(),
        '/dashboard': (context) => const DashboardPage(),
        '/kelompok': (context) => const KelompokPage(),
        '/kalkulator': (context) => const KalkulatorPage(),
        '/bilangan': (context) => const BilanganPage(),
        '/jumlah_field': (context) => const JumlahFieldPage(),
        '/stopwatch': (context) => const StopwatchPage(),
        '/piramid': (context) => const PiramidPage(),
      },
    );
  }
}
