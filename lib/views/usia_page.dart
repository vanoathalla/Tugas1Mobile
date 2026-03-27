import 'package:flutter/material.dart';
import '../controllers/usia_controller.dart';

class UsiaPage extends StatefulWidget {
  const UsiaPage({super.key});
  @override
  State<UsiaPage> createState() => _UsiaPageState();
}

class _UsiaPageState extends State<UsiaPage> {
  final UsiaController _controller = UsiaController();
  String _hasil = "Pilih waktu lahir";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Usia')),
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
                    setState(() {
                      _hasil = _controller.hitungUsiaDetail(
                        DateTime(d.year, d.month, d.day, t.hour, t.minute),
                      );
                    });
                  }
                }
              },
              child: const Text("Input Tanggal & Jam"),
            ),
            const SizedBox(height: 20),
            Text(
              _hasil,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
