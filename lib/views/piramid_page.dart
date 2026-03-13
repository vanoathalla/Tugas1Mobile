import 'package:flutter/material.dart';
import '../controllers/piramid_controller.dart'; // Import controllernya

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
    // Lempar inputan ke Controller
    final hasil = _controller.hitungPiramid(
      _sisiController.text,
      _tinggiController.text,
    );

    setState(() {
      // Tangkap hasil dari Map
      _hasilVolume = hasil['volume']!;
      _hasilLuas = hasil['luas']!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Luas & Volume Piramid')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Input Fields modern
            TextField(
              controller: _sisiController,
              keyboardType: TextInputType.number,
              maxLength: 15, 
              decoration: const InputDecoration(
                labelText: 'Panjang Sisi Alas (a)',
                prefixIcon: Icon(Icons.line_weight_outlined),
                counterText: "", 
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _tinggiController,
              keyboardType: TextInputType.number,
              maxLength: 15, 
              decoration: const InputDecoration(
                labelText: 'Tinggi Piramida (h)',
                prefixIcon: Icon(Icons.height_outlined),
                counterText: "", 
              ),
            ),
            const SizedBox(height: 32),

            // Tombol Hitung responsif ala iOS
            ElevatedButton(
              onPressed: _hitungPiramid,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey[900],
                foregroundColor: Colors.white, 
                minimumSize: const Size(double.infinity, 55),
              ),
              child: const Text(
                'Hitung Sekarang',
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 40),

            // Tampilan Hasil Modern ala iOS (TIDAK DIUBAH)
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
            'Hasil Perhitungan:',
            style: TextStyle(
              fontSize: 16,
              color: Colors.blueGrey,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          _buildHasilItem(
            Icons.view_in_ar_outlined,
            'Volume (V)',
            _hasilVolume,
            Colors.indigo,
          ),
          const Divider(),
          _buildHasilItem(
            Icons.architecture_outlined,
            'Luas (Lp)',
            _hasilLuas,
            Colors.indigoAccent,
          ),
        ],
      ),
    );
  }

  Widget _buildHasilItem(
    IconData icon,
    String label,
    String value,
    Color color,
  ) {
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
              label,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.blueGrey,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}