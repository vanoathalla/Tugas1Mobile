import 'package:flutter/material.dart';

class JumlahFieldPage extends StatefulWidget {
  const JumlahFieldPage({super.key});

  @override
  State<JumlahFieldPage> createState() => _JumlahFieldPageState();
}

class _JumlahFieldPageState extends State<JumlahFieldPage> {
  final TextEditingController _inputController = TextEditingController();
  String _hasil = '0';

  // OPTIMASI 1: Membersihkan controller dari memori pas halaman ditutup
  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  void _hitungTotal() {
    // Pisahin string input berdasarkan koma atau spasi
    List<String> angkaString = _inputController.text.split(RegExp(r'[,\s]+'));

    // GANTI JADI INT: Khusus bilangan bulat sesuai request
    int total = 0;

    for (var str in angkaString) {
      if (str.isNotEmpty) {
        // GANTI JADI INT: Parsing string jadi integer
        total += int.tryParse(str) ?? 0;
      }
    }

    setState(() {
      // Logic jadi super simpel, tinggal di-toString() aja karena pasti bulat
      _hasil = total.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Jumlah Total Field')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // TextField tetap menggunakan bentuk asli, cuma ditambah maxLines biar lega
            TextField(
              controller: _inputController,
              keyboardType:
                  TextInputType.number, // Udah diset khusus keyboard angka
              maxLines: 3,
              decoration: const InputDecoration(
                labelText: 'Masukin deret angka (pisahin pake spasi/koma)',
                prefixIcon: Icon(Icons.add_task_outlined),
                border: OutlineInputBorder(), // Standarisasi border ala aslab
              ),
            ),
            const SizedBox(height: 24),

            // Tombol Hitung
            ElevatedButton(
              onPressed: _hitungTotal,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 55),
                backgroundColor: Colors.blueGrey, // Samain warna tombol
                foregroundColor: Colors.white,
              ),
              child: const Text(
                'Jumlahin Semua',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 40),

            // Card Hasil yang modern (TIDAK DIUBAH SAMA SEKALI)
            Container(
              padding: const EdgeInsets.all(30),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Text(
                    'Total Jumlah:',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.blueGrey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    _hasil,
                    style: const TextStyle(
                      fontSize: 56,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
