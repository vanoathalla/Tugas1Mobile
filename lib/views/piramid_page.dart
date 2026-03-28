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
  final PiramidController _controller = PiramidController();

  String _hasilLuas = "0";
  String _hasilVolume = "0";
  String _pesanPeringatan = "";

  void _hitung() {
    setState(() {
      double s = double.tryParse(_sisiController.text) ?? 0;
      double t = double.tryParse(_tinggiController.text) ?? 0;

      // Tetap hitung hasilnya
      _hasilLuas = _controller.hitungLuas(s, t).toStringAsFixed(2);
      _hasilVolume = _controller.hitungVolume(s, t).toStringAsFixed(2);

      // Cek apakah ada input minus buat nampilin announcement
      if (s < 0 || t < 0) {
        _pesanPeringatan =
            "⚠️ Catatan: SECARA FISIK PIRAMID GAK BOLEH MINUS YA, MASA AMBLAS KE BAWAH TANAH!";
      } else if (s == 0 || t == 0) {
        _pesanPeringatan =
            "⚠️ Catatan: KALAU NOL ITU NAMANYA BUKA PIRAMID, TAPI TANAH DATAR.";
      } else {
        _pesanPeringatan = ""; // Kosongkan kalau input normal
      }
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
        title: const Text("Piramid",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Masukkan Dimensi Piramid",
                style: TextStyle(fontSize: 14, color: Colors.grey)),
            const SizedBox(height: 25),

            _buildInputField("Sisi Alas", _sisiController, Icons.square_foot),
            const SizedBox(height: 20),
            _buildInputField("Tinggi Tegak", _tinggiController, Icons.height),

            const SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: _hitung,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
                child: const Text("Hitung Hasil",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),

            const SizedBox(height: 40),
            const Divider(),
            const SizedBox(height: 20),

            // Box Hasil
            Row(
              children: [
                _buildResultBox("LUAS", _hasilLuas),
                const SizedBox(width: 15),
                _buildResultBox("VOLUME", _hasilVolume),
              ],
            ),

            const SizedBox(height: 25),

            // ANNOUNCEMENT / PERINGATAN (Muncul di bawah hasil)
            if (_pesanPeringatan.isNotEmpty)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 228, 17, 17),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color.fromARGB(255, 0, 0, 0)),
                ),
                child: Text(
                  _pesanPeringatan,
                  style: TextStyle(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      fontSize: 13,
                      fontWeight: FontWeight.w500),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(
      String label, TextEditingController controller, IconData icon) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      style: const TextStyle(fontWeight: FontWeight.bold),
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.black),
        filled: true,
        fillColor: Colors.grey.shade100,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none),
      ),
    );
  }

  Widget _buildResultBox(String title, String value) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          children: [
            Text(title,
                style: const TextStyle(
                    fontSize: 10,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(value,
                style:
                    const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
