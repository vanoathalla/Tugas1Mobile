import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Menu Utama'),
        backgroundColor: Colors.teal[700],
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(16),
        crossAxisCount: 2, // Bikin jadi 2 kolom ke samping
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: [
          _buildMenuCard(context, Icons.group, 'Data Kelompok', '/kelompok'),
          _buildMenuCard(
            context,
            Icons.calculate,
            'Kalkulator +/-',
            '/kalkulator',
          ),
          _buildMenuCard(context, Icons.numbers, 'Cek Bilangan', '/bilangan'),
          _buildMenuCard(
            context,
            Icons.add_chart,
            'Jumlah Field',
            '/jumlah_field',
          ),
          _buildMenuCard(context, Icons.timer, 'Stopwatch', '/stopwatch'),
          _buildMenuCard(
            context,
            Icons.change_history,
            'Hitung Piramid',
            '/piramid',
          ),
        ],
      ),
    );
  }

  Widget _buildMenuCard(
    BuildContext context,
    IconData icon,
    String title,
    String route,
  ) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, route);
      },

      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Colors.orange[300]),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
