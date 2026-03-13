import 'package:flutter/material.dart';
import '../controllers/kalkulator_controller.dart'; // Import controllernya

class KalkulatorPage extends StatefulWidget {
  const KalkulatorPage({super.key});

  @override
  State<KalkulatorPage> createState() => _KalkulatorPageState();
}

class _KalkulatorPageState extends State<KalkulatorPage> {
  final TextEditingController _angka1Controller = TextEditingController();
  final TextEditingController _angka2Controller = TextEditingController();
  String _hasil = '0';

  // Inisialisasi Controller di dalam View
  final KalkulatorController _controller = KalkulatorController();

  // Pastikan controller UI dibersihkan
  @override
  void dispose() {
    _angka1Controller.dispose();
    _angka2Controller.dispose();
    super.dispose();
  }

  void _hitung(String operasi) {
    // View hanya melempar teks ke Controller, dan menerima hasilnya
    String hasilAkhir = _controller.hitung(
      _angka1Controller.text,
      _angka2Controller.text,
      operasi,
    );

    setState(() {
      _hasil = hasilAkhir;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kalkulator +/-')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Hitung Angka",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),

                // Menggunakan helper widget TextField
                _inputField(
                  hint: "Angka Pertama",
                  controller: _angka1Controller,
                ),
                const SizedBox(height: 10),
                _inputField(
                  hint: "Angka Kedua",
                  controller: _angka2Controller,
                ),
                const SizedBox(height: 20),

                // Tombol operasi
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => _hitung('+'),
                        child: const Text("+", style: TextStyle(fontSize: 24)),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => _hitung('-'),
                        child: const Text("-", style: TextStyle(fontSize: 24)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),

                // Tampilan hasil
                const Text(
                  'Hasil Akhir:',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                Text(
                  _hasil,
                  style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _inputField({
    required String hint,
    required TextEditingController controller,
  }) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      maxLength: 15,
      decoration: InputDecoration(
        hintText: hint,
        counterText: "", 
        border: const OutlineInputBorder(),
      ),
    );
  }
}