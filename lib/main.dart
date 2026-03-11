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
      title: 'Tugas Mobile Kalcer',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,

        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black87,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.black87,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Colors.black87),
        ),

        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFFECEFF1),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.blueGrey, width: 2),
          ),
          prefixIconColor: Colors.blueGrey,
          suffixIconColor: Colors.blueGrey,
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF263238),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 2,
            textStyle: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),

      initialRoute: '/',
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
