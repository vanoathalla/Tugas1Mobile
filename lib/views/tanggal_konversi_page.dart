import 'package:flutter/material.dart';
import '../controllers/weton_controller.dart';

class TanggalKonversiPage extends StatefulWidget {
  const TanggalKonversiPage({super.key});
  @override
  State<TanggalKonversiPage> createState() => _TanggalKonversiPageState();
}

class _TanggalKonversiPageState extends State<TanggalKonversiPage> {
  DateTime? _selectedDate;
  String _hasil = "-";
  final WetonController _controller = WetonController();

  void _pilihTanggal() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _hasil = _controller.hitungWeton(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Konversi Weton"),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _pilihTanggal,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
              ),
              child: Text(
                _selectedDate == null
                    ? "Pilih Tanggal"
                    : _selectedDate.toString().split(' ')[0],
              ),
            ),
            const SizedBox(height: 32),
            _buildResultBox("WETON ANDA", _hasil),
          ],
        ),
      ),
    );
  }

  Widget _buildResultBox(String title, String value) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.grey.shade500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w900),
          ),
        ],
      ),
    );
  }
}
