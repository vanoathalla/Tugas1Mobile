import 'package:flutter/material.dart';
import '../controllers/jumlah_field_controller.dart'; // Import controllernya

class JumlahFieldPage extends StatefulWidget {
  const JumlahFieldPage({super.key});

  @override
  State<JumlahFieldPage> createState() => _JumlahFieldPageState();
}

class _JumlahFieldPageState extends State<JumlahFieldPage> {
  final TextEditingController _inputController = TextEditingController();
  String _hasil = '0';

  // Inisialisasi Controller
  final JumlahFieldController _controller = JumlahFieldController();

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  void _hitungTotal() {
    // View cuma ngelempar teks ke Controller dan nangkep hasil jadinya
    String hasilHitung = _controller.hitungTotal(_inputController.text);

    setState(() {
      _hasil = hasilHitung;
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
            TextField(
              controller: _inputController,
              keyboardType: TextInputType.number, 
              maxLines: 3, 
              decoration: const InputDecoration(
                labelText: 'Masukin deret angka (pisahin pake spasi/koma)',
                prefixIcon: Icon(Icons.add_task_outlined),
                border: OutlineInputBorder(), 
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _hitungTotal,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 55),
                backgroundColor: Colors.blueGrey[900], 
                foregroundColor: Colors.white,
              ),
              child: const Text(
                'Jumlahin Semua',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 40),

            // Card Hasil (Nggak ada yang diubah)
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