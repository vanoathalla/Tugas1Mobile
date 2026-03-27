import 'package:flutter/material.dart';
import '../controllers/hijriah_controller.dart';

class HijriahPage extends StatefulWidget {
  const HijriahPage({super.key});
  @override
  State<HijriahPage> createState() => _HijriahPageState();
}

class _HijriahPageState extends State<HijriahPage> {
  final HijriahController _controller = HijriahController();
  String _hasil = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Masehi ke Hijriah')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                DateTime? p = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100),
                );
                if (p != null)
                  setState(() => _hasil = _controller.formatHijriah(p));
              },
              child: const Text("Pilih Tanggal Masehi"),
            ),
            const SizedBox(height: 20),
            Text(
              _hasil,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
