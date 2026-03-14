import 'package:flutter/material.dart';
import '../controllers/bilangan_controller.dart';

class BilanganPage extends StatefulWidget {
  const BilanganPage({super.key});

  @override
  State<BilanganPage> createState() => _BilanganPageState();
}

class _BilanganPageState extends State<BilanganPage> {
  final TextEditingController _angkaController = TextEditingController();
  String _hasilGanjilGenap = '-';
  String _hasilPrima = '-';

  // Inisialisasi Controller
  final BilanganController _controller = BilanganController();

  @override
  void dispose() {
    _angkaController.dispose();
    super.dispose();
  }

  void _cekBilangan() {
    final hasil = _controller.cekBilangan(_angkaController.text);

    setState(() {
      _hasilGanjilGenap = hasil['ganjilGenap']!;
      _hasilPrima = hasil['prima']!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Background putih bersih
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ), // Tombol back hitam
        title: const Text(
          'Cek Bilangan',
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
            const Icon(Icons.numbers_outlined, size: 64, color: Colors.black87),
            const SizedBox(height: 24),

            // Input field minimalis
            _inputField(
              hint: 'Masukkan Angka Bulat',
              controller: _angkaController,
            ),
            const SizedBox(height: 24),

            // Tombol style monochrome
            ElevatedButton(
              onPressed: _cekBilangan,
              style: _buttonStyle(),
              child: const Text(
                'Cek Sekarang',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ),
            const SizedBox(height: 48),

            // Tampilan Hasil yang Clean & Elegan (Dimodifikasi sesuai request)
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
        border: Border.all(
          color: Colors.grey.shade200,
          width: 1.5,
        ), // Hanya pakai garis tepi tipis
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center, // Rata tengah
        children: [
          Text(
            'HASIL ANALISA',
            style: TextStyle(
              fontSize: 12,
              letterSpacing: 1.5,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade500,
            ),
          ),
          const SizedBox(height: 24),
          // Hapus icon dan tampilkan teks rata tengah
          Text(
            _hasilGanjilGenap,
            textAlign: TextAlign.center, // Rata tengah
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          const Divider(height: 32, color: Colors.black12),
          Text(
            _hasilPrima,
            textAlign: TextAlign.center, // Rata tengah
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  // Fungsi helper _buildHasilItem() dihapus karena tidak digunakan lagi.

  // Helper untuk TextField bergaya Monochrome
  Widget _inputField({
    required String hint,
    required TextEditingController controller,
  }) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      maxLength: 18,
      style: const TextStyle(color: Colors.black, fontSize: 18),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 16),
        counterText: "",
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

  // Helper untuk style button bergaya Monochrome
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
