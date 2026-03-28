import 'package:flutter/material.dart';
import '../controllers/hijriah_controller.dart';

class HijriahPage extends StatefulWidget {
  const HijriahPage({super.key});

  @override
  State<HijriahPage> createState() => _HijriahPageState();
}

class _HijriahPageState extends State<HijriahPage> {
  DateTime? _selectedDate;
  String _hasil = "-";
  final HijriahController _controller = HijriahController();

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
        _hasil = _controller.konversiKeHijriah(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text('Masehi ke Hijriah',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600)),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.mosque_outlined,
                  size: 64, color: Colors.black87),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _pilihTanggal,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  child: Text(
                    _selectedDate == null
                        ? "PILIH TANGGAL MASEHI"
                        : "${_selectedDate!.day}-${_selectedDate!.month}-${_selectedDate!.year}",
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 48),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade200, width: 1.5),
                ),
                child: Column(
                  children: [
                    Text('TANGGAL HIJRIAH',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade500,
                            letterSpacing: 1.5)),
                    const SizedBox(height: 8),
                    Text(_hasil,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w900,
                            color: Colors.black)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
