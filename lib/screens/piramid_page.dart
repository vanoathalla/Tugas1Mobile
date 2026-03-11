import 'package:flutter/material.dart';
import 'dart:math'; // Biar bisa pake sqrt (akar) buat ngitung luas

class PiramidPage extends StatefulWidget {
  const PiramidPage({super.key});

  @override
  State<PiramidPage> createState() => _PiramidPageState();
}

class _PiramidPageState extends State<PiramidPage> {
  final TextEditingController _sisiController = TextEditingController();
  final TextEditingController _tinggiController = TextEditingController();
  String _hasilVolume = '';
  String _hasilLuas = '';

  void _hitungPiramid() {
    double sisi = double.tryParse(_sisiController.text) ?? 0;
    double tinggi = double.tryParse(_tinggiController.text) ?? 0;

    // Hitung Volume (1/3 * Luas Alas * Tinggi)
    double volume = (1 / 3) * (sisi * sisi) * tinggi;

    // Hitung Luas Permukaan (Luas Alas + 4 * Luas Segitiga Tegak)
    double tinggiMiring = sqrt(pow((sisi / 2), 2) + pow(tinggi, 2));
    double luasPermukaan = (sisi * sisi) + (4 * (0.5 * sisi * tinggiMiring));

    setState(() {
      _hasilVolume = 'Volume = ${volume.toStringAsFixed(2)}';
      _hasilLuas = 'Luas Permukaan = ${luasPermukaan.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Luas & Volume Piramid'),
        backgroundColor: Colors.teal[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _sisiController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Panjang Sisi Alas',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _tinggiController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Tinggi Piramida',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: _hitungPiramid,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal[800],
              ),
              child: const Text('Hitung Sekarang'),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              color: Colors.orange[100],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Hasil:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(_hasilVolume, style: const TextStyle(fontSize: 16)),
                  Text(_hasilLuas, style: const TextStyle(fontSize: 16)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
