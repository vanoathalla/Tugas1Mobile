import 'package:flutter/material.dart';
import 'login_page.dart';
import 'kelompok_page.dart';
import 'kalkulator_page.dart';
import 'bilangan_page.dart';
import 'jumlah_field_page.dart';
import 'stopwatch_page.dart';
import 'piramid_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Menu Utama'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              // Logout dengan menghapus history menggunakan pushReplacement
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: GridView.count(
          padding: const EdgeInsets.all(16),
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1.1,
          children: [
            // Sekarang kita mengirim Widget Halaman langsung, bukan text '/route'
            _buildMenuCard(
              context,
              Icons.group_outlined,
              'Data Kelompok',
              const KelompokPage(),
              Colors.teal,
            ),
            _buildMenuCard(
              context,
              Icons.calculate_outlined,
              'Kalkulator +/-',
              const KalkulatorPage(),
              Colors.blue,
            ),
            _buildMenuCard(
              context,
              Icons.numbers_outlined,
              'Cek Bilangan',
              const BilanganPage(),
              Colors.orange,
            ),
            _buildMenuCard(
              context,
              Icons.add_chart_outlined,
              'Jumlah Field',
              const JumlahFieldPage(),
              Colors.purple,
            ),
            _buildMenuCard(
              context,
              Icons.timer_outlined,
              'Stopwatch',
              const StopwatchPage(),
              Colors.red,
            ),
            _buildMenuCard(
              context,
              Icons.change_history_outlined,
              'Hitung Piramid',
              const PiramidPage(),
              Colors.indigo,
            ),
          ],
        ),
      ),
    );
  }

  // Parameter string route diganti menjadi Widget targetPage
  Widget _buildMenuCard(
    BuildContext context,
    IconData icon,
    String title,
    Widget targetPage,
    Color color,
  ) {
    return InkWell(
      onTap: () {
        // Navigasi pindah halaman menggunakan MaterialPageRoute
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => targetPage),
        );
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: color),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
