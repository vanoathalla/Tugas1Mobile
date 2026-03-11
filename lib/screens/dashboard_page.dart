import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard Menu Utama'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_outlined, color: Colors.redAccent),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Tugas Mobile Flutter',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),

              GridView.count(
                physics:
                    const NeverScrollableScrollPhysics(), // Biar di-scroll sama parentnye
                shrinkWrap: true,
                crossAxisCount: 2, // Bikin jadi 2 kolom ke samping
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.1, // Biar kotake agak proporsional
                children: [
                  _buildMenuCard(
                    context,
                    Icons.group_outlined,
                    'Data Kelompok',
                    '/kelompok',
                    Colors.teal,
                  ),
                  _buildMenuCard(
                    context,
                    Icons.calculate_outlined,
                    'Kalkulator +/-',
                    '/kalkulator',
                    Colors.blue,
                  ),
                  _buildMenuCard(
                    context,
                    Icons.numbers_outlined,
                    'Cek Bilangan',
                    '/bilangan',
                    Colors.orange,
                  ),
                  _buildMenuCard(
                    context,
                    Icons.add_chart_outlined,
                    'Jumlah Field',
                    '/jumlah_field',
                    Colors.purple,
                  ),
                  _buildMenuCard(
                    context,
                    Icons.timer_outlined,
                    'Stopwatch',
                    '/stopwatch',
                    Colors.red,
                  ),
                  _buildMenuCard(
                    context,
                    Icons.change_history_outlined,
                    'Hitung Piramid',
                    '/piramid',
                    Colors.indigo,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Fungsi khusus biar kita ga perlu nulis ulang kodingan card buat tiap menu
  Widget _buildMenuCard(
    BuildContext context,
    IconData icon,
    String title,
    String route,
    Color color,
  ) {
    return InkWell(
      onTap: () {
        // Cek kalo rutenye udah ada, langsung sikat pindah halaman
        Navigator.pushNamed(context, route);
      },
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 40, color: color),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
