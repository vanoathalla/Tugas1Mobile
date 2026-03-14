import 'package:flutter/material.dart';
import '../controllers/jumlah_field_controller.dart';

class JumlahFieldPage extends StatefulWidget {
  const JumlahFieldPage({super.key});

  @override
  State<JumlahFieldPage> createState() => _JumlahFieldPageState();
}

class _JumlahFieldPageState extends State<JumlahFieldPage> {
  final TextEditingController _inputController = TextEditingController();
  String _hasil = '0';

  final JumlahFieldController _controller = JumlahFieldController();

  @override
  void dispose() {
    _inputController.dispose();
    super.dispose();
  }

  void _showError(String pesan) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.black87,
        content: Text(pesan, style: const TextStyle(color: Colors.white)),
      ),
    );
  }

  void _hitungTotal() {
    if (_inputController.text.trim().isEmpty) {
      _showError("Deret angkanya jangan dikosongin ye.");
      return;
    }
    if (RegExp(r'[a-zA-Z]').hasMatch(_inputController.text)) {
      _showError("Inputan ngawur! Jangan masukin huruf, pake angka aje.");
      return;
    }

    String hasilHitung = _controller.hitungTotal(_inputController.text);

    setState(() {
      _hasil = hasilHitung;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Jumlah Total Field',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(Icons.add_box_outlined, size: 64, color: Colors.black87),
            const SizedBox(height: 24),
            _inputField(
              hint: 'Masukin deret angka (pisahin spasi/koma)',
              controller: _inputController,
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _hitungTotal,
              style: _buttonStyle(),
              child: const Text(
                'Jumlahin Semua',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ),
            const SizedBox(height: 48),
            Container(
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade200, width: 1.5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'TOTAL JUMLAH',
                    style: TextStyle(
                      fontSize: 12,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade500,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    _hasil,
                    style: const TextStyle(
                      fontSize: 56,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                      letterSpacing: -1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
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
      maxLines: 3,
      style: const TextStyle(color: Colors.black, fontSize: 18),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 16),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 18,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.black, width: 2),
        ),
      ),
    );
  }

  ButtonStyle _buttonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 18),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    );
  }
}
