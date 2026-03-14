import 'package:flutter/material.dart';
import '../controllers/kalkulator_controller.dart';

class KalkulatorPage extends StatefulWidget {
  const KalkulatorPage({super.key});

  @override
  State<KalkulatorPage> createState() => _KalkulatorPageState();
}

class _KalkulatorPageState extends State<KalkulatorPage> {
  final TextEditingController _angka1Controller = TextEditingController();
  final TextEditingController _angka2Controller = TextEditingController();
  String _hasil = '0';

  // Inisialisasi Controller
  final KalkulatorController _controller = KalkulatorController();

  @override
  void dispose() {
    _angka1Controller.dispose();
    _angka2Controller.dispose();
    super.dispose();
  }

  void _hitung(String operasi) {
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
      backgroundColor: Colors.white, // Background putih bersih
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ), // Tombol back jadi hitam
        title: const Text(
          'Kalkulator +/-',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(
                  Icons.calculate_outlined,
                  size: 64,
                  color: Colors.black87,
                ),
                const SizedBox(height: 24),

                // Input Fields minimalis
                _inputField(
                  hint: "Masukkan Angka Pertama",
                  controller: _angka1Controller,
                ),
                const SizedBox(height: 16),
                _inputField(
                  hint: "Masukkan Angka Kedua",
                  controller: _angka2Controller,
                ),
                const SizedBox(height: 32),

                // Tombol operasi monochrome
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => _hitung('+'),
                        style: _buttonStyle(),
                        child: const Text(
                          "+",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => _hitung('-'),
                        style: _buttonStyle(),
                        child: const Text(
                          "-",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 48),

                // Tampilan hasil yang clean
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 24,
                    horizontal: 16,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade200, width: 1.5),
                  ),
                  child: Column(
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
                      const SizedBox(height: 8),
                      Text(
                        _hasil,
                        style: const TextStyle(
                          fontSize: 48,
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
        ),
      ),
    );
  }

  // Helper untuk TextField bergaya Monochrome
  Widget _inputField({
    required String hint,
    required TextEditingController controller,
  }) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      maxLength: 15,
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
      padding: const EdgeInsets.symmetric(vertical: 16),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    );
  }
}
