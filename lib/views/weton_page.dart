import 'package:flutter/material.dart';
import '../controllers/weton_controller.dart';
import 'package:intl/intl.dart';

class WetonPage extends StatefulWidget {
  const WetonPage({super.key});
  @override
  State<WetonPage> createState() => _WetonPageState();
}

class _WetonPageState extends State<WetonPage> {
  final WetonController _controller = WetonController();
  final TextEditingController _dateInput = TextEditingController();
  String _hasil = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Konversi Weton')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _dateInput,
              readOnly: true,
              decoration: const InputDecoration(
                labelText: "Pilih Tanggal",
                suffixIcon: Icon(Icons.calendar_month),
              ),
              onTap: () async {
                DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime(2100),
                );
                if (picked != null) {
                  setState(() {
                    _dateInput.text = DateFormat(
                      'dd MMMM yyyy',
                      'id_ID',
                    ).format(picked);
                    _hasil = _controller.hitungWeton(picked);
                  });
                }
              },
            ),
            const SizedBox(height: 30),
            Text(
              _hasil,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
