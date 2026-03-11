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

    // Cek Prima
    bool isPrima = true;
    if (angka <= 1) {
      isPrima = false;
    } else {
      for (int i = 2; i <= angka / 2; i++) {
        if (angka % i == 0) {
          isPrima = false;
          break;
        }
      }
    }
    String prima = isPrima ? 'Bilangan Prima' : 'Bukan Bilangan Prima';

    setState(() {
      _hasilGanjilGenap = 'Angka $angka adalah bilangan $ganjilGenap';
      _hasilPrima = 'Dan $prima';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cek Bilangan'),
        backgroundColor: Colors.teal[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _angkaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Masukin Angka Bulat',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _cekBilangan,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal[800],
              ),
              child: const Text('Cek Sekarang'),
            ),
            const SizedBox(height: 24),
            Text(
              _hasilGanjilGenap,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              _hasilPrima,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
