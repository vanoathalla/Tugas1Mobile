import 'package:flutter/material.dart';
// Ini buat manggil file-file yang ada di folder screens
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
    // Kite pake skema warna yang lebih kaya biar kalcer
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tugas Mobile Kalcer',
      theme: ThemeData(
        // Tema utama Slate & Peach
        primarySwatch: Colors.blueGrey,
        scaffoldBackgroundColor: Colors.white,
        cardTheme: CardTheme(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          shadowColor: Colors.black.withOpacity(0.1),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Colors.black),
        ),
        // Modern Input Decoration Theme
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.blueGrey[50],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.blueGrey[400]!, width: 2),
          ),
          prefixIconColor: Colors.blueGrey[400],
          suffixIconColor: Colors.blueGrey[400],
        ),
        // Modern Button Theme
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueGrey[900],
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
