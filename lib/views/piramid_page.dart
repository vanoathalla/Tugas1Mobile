import 'package:flutter/material.dart';
import '../controllers/piramid_controller.dart'; 

class PiramidPage extends StatefulWidget {
  const PiramidPage({super.key});

  @override
  State<PiramidPage> createState() => _PiramidPageState();
}

class _PiramidPageState extends State<PiramidPage> {
  final TextEditingController _sisiController = TextEditingController();
  final TextEditingController _tinggiController = TextEditingController();
  String _hasilVolume = '0.00';
  String _hasilLuas = '0.00';

  // Inisialisasi Controller
  final PiramidController _controller = PiramidController();

  @override
  void dispose() {
    _sisiController.dispose();
    _tinggiController.dispose();
    super.dispose();
  }

  void _hitungPiramid() {
    final hasil = _controller.hitungPiramid(
      _sisiController.text,
      _tinggiController.text,
    );

    setState(() {
      _hasilVolume = hasil['volume']!;
      _hasilLuas = hasil['luas']!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Background putih bersih
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black), // Tombol back hitam
        title: const Text(
          'Luas & Volume Piramid',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(Icons.change_history_outlined, size: 64, color: Colors.black87),
            const SizedBox(height: 24),

            // Input Fields minimalis
            _inputField(
              hint: 'Panjang Sisi Alas (a)',
              controller: _sisiController,
            ),
            const SizedBox(height: 16),
            _inputField(
              hint: 'Tinggi Piramida (h)',
              controller: _tinggiController,
            ),
            const SizedBox(height: 24),

            // Tombol style monochrome
            ElevatedButton(
              onPressed: _hitungPiramid,
              style: _buttonStyle(),
              child: const Text('Hitung Sekarang', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1)),
            ),
            const SizedBox(height: 48),

            // Tampilan Hasil Clean tanpa Icon
            _buildResultCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildResultCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200, width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center, // Teks rata tengah
        children: [
          Text(
            'HASIL PERHITUNGAN',
            style: TextStyle(
              fontSize: 12,
              letterSpacing: 1.5,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade500,
            ),
          ),
          const SizedBox(height: 24),
          
          // Bagian Volume
          Text(
            'Volume (V)',
            style: TextStyle(fontSize: 14, color: Colors.grey.shade600, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 4),
          Text(
            _hasilVolume,
            style: const TextStyle(fontSize: 36, fontWeight: FontWeight.w900, color: Colors.black, letterSpacing: -1.0),
          ),
          
          const Divider(height: 32, color: Colors.black12),
          
          // Bagian Luas Permukaan
          Text(
            'Luas Permukaan (Lp)',
            style: TextStyle(fontSize: 14, color: Colors.grey.shade600, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 4),
          Text(
            _hasilLuas,
            style: const TextStyle(fontSize: 36, fontWeight: FontWeight.w900, color: Colors.black, letterSpacing: -1.0),
          ),
        ],
      ),
    );
  }

  // Helper untuk TextField bergaya Monochrome
  Widget _inputField({required String hint, required TextEditingController controller}) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      maxLength: 15, 
      style: const TextStyle(color: Colors.black, fontSize: 18),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 16),
        counterText: "", 
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
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

  // Helper untuk style button bergaya Monochrome
  ButtonStyle _buttonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 18),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}