import 'package:flutter/material.dart';

class JumlahFieldPage extends StatefulWidget {
  const JumlahFieldPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Jumlah Total Field')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _inputController,
              keyboardType: TextInputType.text,
              maxLines: 3, // Biar legaan masukin angkanye
              decoration: const InputDecoration(
                labelText: 'Masukin deret angka (pisahin pake spasi/koma)',
                prefixIcon: Icon(Icons.add_task_outlined),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _hitungTotal,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 55),
              ),
              child: const Text(
                'Jumlahin Semua',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 40),

            // Card Hasil yang modern
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

  final TextEditingController _inputController = TextEditingController();
  String _hasil = '0';

  void _hitungTotal() {
    // Kite pisahin angkanye berdasarkan koma atau spasi
    List<String> angkaString = _inputController.text.split(RegExp(r'[,\s]+'));
    double total = 0;

    for (var str in angkaString) {
      if (str.isNotEmpty) {
        total += double.tryParse(str) ?? 0;
      }
    }

    setState(() {
      _hasil = total.toString();
    });
  }
}
