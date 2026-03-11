import 'package:flutter/material.dart';

class JumlahFieldPage extends StatefulWidget {
  const JumlahFieldPage({super.key});

  @override
  State<JumlahFieldPage> createState() => _JumlahFieldPageState();
}

class _JumlahFieldPageState extends State<JumlahFieldPage> {
  final TextEditingController _inputController = TextEditingController();
  String _hasil = '0';

  void _hitungTotal() {
    // Kite pisahin angkanye berdasarkan koma atau spasi
    List<String> angkaString = _inputController.text.split(RegExp(r'[,\s]+'));
    double total = 0;

    for (var str in angkaString) {
      total += double.tryParse(str) ?? 0;
    }

    setState(() {
      _hasil = total.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jumlah Total Field'),
        backgroundColor: Colors.teal[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _inputController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: 'Masukin deret angka (pisahin pake spasi/koma)',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _hitungTotal,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal[800],
              ),
              child: const Text('Jumlahin Semua'),
            ),
            const SizedBox(height: 24),
            const Text('Total Jumlah:', style: TextStyle(fontSize: 18)),
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
