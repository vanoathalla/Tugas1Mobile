import 'package:flutter/material.dart';
import '../controllers/bilangan_controller.dart'; // Import controllernya

class BilanganPage extends StatefulWidget {
  const BilanganPage({super.key});

  @override
  State<BilanganPage> createState() => _BilanganPageState();
}

class _BilanganPageState extends State<BilanganPage> {
  final TextEditingController _angkaController = TextEditingController();
  String _hasilGanjilGenap = '';
  String _hasilPrima = '';

  // Inisialisasi Controller
  final BilanganController _controller = BilanganController();

  @override
  void dispose() {
    _angkaController.dispose();
    super.dispose();
  }

  void _cekBilangan() {
    // View cukup melempar inputan ke Controller
    final hasil = _controller.cekBilangan(_angkaController.text);

    setState(() {
      // Menangkap hasil kembalian dari map Controller
      _hasilGanjilGenap = hasil['ganjilGenap']!;
      _hasilPrima = hasil['prima']!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cek Bilangan')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _angkaController,
              keyboardType: TextInputType.number,
              maxLength: 18, 
              decoration: const InputDecoration(
                labelText: 'Masukin Angka Bulat',
                prefixIcon: Icon(Icons.numbers_outlined),
                counterText: "", 
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _cekBilangan,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 55),
                backgroundColor: Colors.blueGrey[900], 
                foregroundColor: Colors.white,
              ),
              child: const Text('Cek Sekarang', style: TextStyle(fontSize: 18)),
            ),
            const SizedBox(height: 40),

            // Tampilan Hasil (Nggak ada yang diubah)
            _buildResultCard(context),
          ],
        ),
      ),
    );
  }

  Widget _buildResultCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 15,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            'Hasil Analisa:',
            style: TextStyle(
              fontSize: 16,
              color: Colors.blueGrey,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          _buildHasilItem(
            Icons.repeat_one_outlined,
            _hasilGanjilGenap,
            Colors.teal,
          ),
          const Divider(),
          _buildHasilItem(Icons.star_outline, _hasilPrima, Colors.orange),
        ],
      ),
    );
  }

  Widget _buildHasilItem(IconData icon, String text, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}