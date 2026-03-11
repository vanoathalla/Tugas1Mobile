import 'package:flutter/material.dart';

class KalkulatorPage extends StatefulWidget {
  const KalkulatorPage({super.key});

  @override
  State<KalkulatorPage> createState() => _KalkulatorPageState();
}

class _KalkulatorPageState extends State<KalkulatorPage> {
  final TextEditingController _angka1Controller = TextEditingController();
  final TextEditingController _angka2Controller = TextEditingController();
  String _hasil = '0';

  void _hitung(String operasi) {
    double angka1 = double.tryParse(_angka1Controller.text) ?? 0;
    double angka2 = double.tryParse(_angka2Controller.text) ?? 0;
    double hasilHitung = 0;

    if (operasi == '+') {
      hasilHitung = angka1 + angka2;
    } else if (operasi == '-') {
      hasilHitung = angka1 - angka2;
    }

    setState(() {
      _hasil = hasilHitung.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kalkulator +/-'),
        backgroundColor: Colors.teal[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _angka1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Angka Pertama',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _angka2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Angka Kedua',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _hitung('+'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal[800],
                    minimumSize: const Size(100, 50),
                  ),
                  child: const Text('+', style: TextStyle(fontSize: 24)),
                ),
                ElevatedButton(
                  onPressed: () => _hitung('-'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange[800],
                    minimumSize: const Size(100, 50),
                  ),
                  child: const Text('-', style: TextStyle(fontSize: 24)),
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text('Hasil:', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Text(
              _hasil,
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
