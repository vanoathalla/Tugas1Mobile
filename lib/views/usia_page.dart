import 'package:flutter/material.dart';
import '../controllers/usia_controller.dart';

class UsiaPage extends StatefulWidget {
  const UsiaPage({super.key});
  @override
  State<UsiaPage> createState() => _UsiaPageState();
}

class _UsiaPageState extends State<UsiaPage> {
  final UsiaController _controller = UsiaController();
  String _hasilUsia = "Pilih Waktu Lahir";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Input Tanggal Lahir')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                DateTime? d = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );
                if (d != null) {
                  TimeOfDay? t = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (t != null) {
                    var res = _controller.hitungUsiaDetail(
                      DateTime(d.year, d.month, d.day, t.hour, t.minute),
                      DateTime.now(),
                    );
                    setState(() {
                      _hasilUsia =
                          "${res['years']} Tahun, ${res['months']} Bulan, ${res['days']} Hari\n${res['hours']} Jam, ${res['minutes']} Menit";
                    });
                  }
                }
              },
              child: const Text("Pilih Tanggal & Jam"),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                _hasilUsia,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
