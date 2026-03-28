import 'package:flutter/material.dart';
import 'kalkulator_page.dart';
import 'bilangan_page.dart';
import 'jumlah_field_page.dart';
import 'piramid_page.dart';
import 'stopwatch_page.dart';
import 'kelompok_page.dart';
import 'login_page.dart';
import 'weton_page.dart';
import 'umur_page.dart';
import 'hijriah_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Menu Utama',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 22,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_outlined, color: Colors.redAccent),
            tooltip: 'Keluar',
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: [
          _buildMinimalistTile(
            context,
            'Kalkulator',
            'Operasi Tambah dan Kurang',
            Icons.calculate_outlined,
            const KalkulatorPage(),
          ),
          _buildMinimalistTile(
            context,
            'Cek Bilangan',
            'Ganjil Genap dan Prima',
            Icons.numbers_outlined,
            const BilanganPage(),
          ),
          _buildMinimalistTile(
            context,
            'Jumlah Field',
            'Penjumlahan Deret Angka',
            Icons.add_box_outlined,
            const JumlahFieldPage(),
          ),
          _buildMinimalistTile(
            context,
            'Hitung Piramid',
            'Volume dan Luas Permukaan',
            Icons.change_history_outlined,
            const PiramidPage(),
          ),
          _buildMinimalistTile(
            context,
            'Stopwatch',
            'Penghitung Waktu',
            Icons.timer_outlined,
            const StopwatchPage(),
          ),
          _buildMinimalistTile(
            context,
            'Anggota Kelompok',
            'Data Anggota',
            Icons.people_outline,
            const KelompokPage(),
          ),
          _buildMinimalistTile(
            context,
            'Konversi Weton',
            'Cek Hari dan Pasaran Jawa',
            Icons.calendar_month_outlined,
            const WetonPage(),
          ),
          _buildMinimalistTile(
            context,
            'Hitung Umur Detail',
            'Tahun, Bulan, Hari, Jam, Menit',
            Icons.hourglass_empty_outlined,
            const UmurPage(),
          ),
          _buildMinimalistTile(
            context,
            'Masehi ke Hijriah',
            'Konversi Kalender Islam',
            Icons.mosque_outlined,
            const HijriahPage(),
          ),
        ],
      ),
    );
  }

  Widget _buildMinimalistTile(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    Widget page,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.shade300, width: 1.5),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: Colors.black87),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.grey.shade400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
