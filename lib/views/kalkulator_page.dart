import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../controllers/kalkulator_controller.dart';

class KalkulatorPage extends StatefulWidget {
  const KalkulatorPage({super.key});

  @override
  State<KalkulatorPage> createState() => _KalkulatorPageState();
}

class _KalkulatorPageState extends State<KalkulatorPage> {
  final TextEditingController _displayController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final KalkulatorController _controller = KalkulatorController();

  String _angkaPertama = "";
  String _operasi = "";
  String _hasil = "";
  bool _isDone = false; // Flag penanda tombol = sudah ditekan

  @override
  void dispose() {
    _displayController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _handleInput(String value) {
    setState(() {
      if (value == "C") {
        _displayController.clear();
        _angkaPertama = "";
        _operasi = "";
        _hasil = "";
        _isDone = false;
      } else if (value == "⌫") {
        if (!_isDone && _displayController.text.isNotEmpty) {
          _displayController.text = _displayController.text
              .substring(0, _displayController.text.length - 1);
        }
      } else if (value == "+" || value == "-") {
        if (_displayController.text.isNotEmpty && !_isDone) {
          _angkaPertama = _displayController.text;
          _operasi = value;
          _displayController.text = "$_angkaPertama$_operasi";
        }
      } else if (value == "=") {
        if (_angkaPertama.isNotEmpty && _operasi.isNotEmpty && !_isDone) {
          String fullText = _displayController.text;
          String angkaKedua = fullText.substring(_angkaPertama.length + 1);

          if (angkaKedua.isNotEmpty) {
            // Memanggil logika hitung asli dari controller
            _hasil = _controller.hitung(_angkaPertama, angkaKedua, _operasi);
            _isDone = true; // Angka input otomatis naik & jadi abu-abu
          }
        }
      } else {
        // Reset jika input angka baru setelah hasil keluar
        if (_isDone) {
          _displayController.text = value;
          _hasil = "";
          _isDone = false;
          _angkaPertama = "";
          _operasi = "";
        } else {
          _displayController.text += value;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text('Kalkulator',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: RawKeyboardListener(
        focusNode: _focusNode,
        autofocus: true,
        onKey: (event) {
          if (event is RawKeyDownEvent) {
            if (event.logicalKey == LogicalKeyboardKey.enter) _handleInput("=");
            if (event.logicalKey == LogicalKeyboardKey.escape)
              _handleInput("C");
            if (event.logicalKey == LogicalKeyboardKey.backspace)
              _handleInput("⌫");
          }
        },
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 32.0, vertical: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Baris Atas: Otomatis naik & jadi abu-abu setelah klik "="
                  TextField(
                    controller: _displayController,
                    textAlign: TextAlign.right,
                    readOnly: false,
                    style: TextStyle(
                        fontSize: _isDone ? 32 : 56, // Ukuran mengecil pas naik
                        color: _isDone ? Colors.grey.shade400 : Colors.black,
                        fontWeight: FontWeight.w500),
                    decoration: const InputDecoration(
                        border: InputBorder.none, hintText: "0"),
                  ),
                  const SizedBox(height: 10),
                  // Baris Bawah: Hasil utama yang muncul setelah klik "="
                  if (_isDone)
                    Text(
                      _hasil,
                      style: const TextStyle(
                          fontSize: 72,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                ],
              ),
            ),
            const Spacer(),
            // Area Tombol
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildRow(["7", "8", "9", "⌫"]),
                  _buildRow(["4", "5", "6", "C"]),
                  _buildRow(["1", "2", "3", "="]),
                  _buildRow(["0", "-", "+"]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(List<String> labels) {
    return Row(
      children: labels.map((label) => _buildButton(label)).toList(),
    );
  }

  Widget _buildButton(String label) {
    bool isOp = ["+", "-", "=", "C", "⌫"].contains(label);
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: () => _handleInput(label),
          borderRadius: BorderRadius.circular(15),
          child: Container(
            height: 70,
            decoration: BoxDecoration(
              color: isOp ? Colors.black : Colors.grey.shade100,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Text(label,
                  style: TextStyle(
                      color: isOp
                          ? (label == "⌫"
                              ? const Color.fromARGB(255, 230, 45, 45)
                              : Colors.white)
                          : Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.bold)),
            ),
          ),
        ),
      ),
    );
  }
}
