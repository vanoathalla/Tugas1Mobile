import 'package:flutter/material.dart';

class BilanganPage extends StatefulWidget {
  const BilanganPage({super.key});

  @override
  State<BilanganPage> createState() => _BilanganPageState();
}

class _BilanganPageState extends State<BilanganPage> {
  final TextEditingController _angkaController = TextEditingController();
  String _hasilGanjilGenap = '';
  String _hasilPrima = '';

  // OPTIMASI 2: Wajib ada dispose untuk membersihkan memori controller
  @override
  void dispose() {
    _angkaController.dispose();
    super.dispose();
  }

  void _cekBilangan() {
    int? angka = int.tryParse(_angkaController.text);
    if (angka == null) {
      setState(() {
        _hasilGanjilGenap = 'Masukin angka yang bener ye!';
        _hasilPrima = '';
      });
      return;
    }

    // Cek Ganjil Genap
    String ganjilGenap = (angka % 2 == 0) ? 'Genap' : 'Ganjil';

    // Cek Prima (OPTIMASI 1: Algoritma lebih cepat dan efisien)
    bool isPrima = true;
    if (angka <= 1) {
      isPrima = false; // 0, 1, dan minus bukan bilangan prima
    } else if (angka == 2) {
      isPrima = true; // 2 adalah prima
    } else if (angka % 2 == 0) {
      isPrima = false; // Semua genap selain 2 pasti bukan prima
    } else {
      // Looping hanya untuk bilangan ganjil sampai akar kuadratnya (i * i <= angka)
      // Ini jauh lebih cepat dari pada 'angka / 2'
      for (int i = 3; i * i <= angka; i += 2) {
        if (angka % i == 0) {
          isPrima = false;
          break;
        }
      }
    }

    String prima = isPrima ? 'Prima' : 'Bukan Prima';

    setState(() {
      _hasilGanjilGenap = 'Angka $angka adalah $ganjilGenap';
      _hasilPrima = 'Dan $prima';
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
              // OPTIMASI 3: Batasin digit maksimal int 64-bit biar ga error
              maxLength: 18,
              decoration: const InputDecoration(
                labelText: 'Masukkan Angka Bulat',
                prefixIcon: Icon(Icons.numbers_outlined),
                // counterText: "", // Sembunyiin teks counter di bawah textfield
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _cekBilangan,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 55),
                backgroundColor: Colors
                    .blueGrey, // Gua tambahin warna biar buttonnya ga polosan abu-abu
                foregroundColor: Colors.white,
              ),
              child: const Text('Cek Sekarang', style: TextStyle(fontSize: 18)),
            ),
            const SizedBox(height: 40),

            // Tampilan Hasil Modern (TIDAK DIUBAH SAMA SEKALI)
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
