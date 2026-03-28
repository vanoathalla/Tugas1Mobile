import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../controllers/stopwatch_controller.dart';

class StopwatchPage extends StatefulWidget {
  const StopwatchPage({super.key});

  @override
  State<StopwatchPage> createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {
  final StopwatchController _controller = StopwatchController();
  Timer? _timer;
  int _elapsedMs = 0;
  bool _isRunning = false;
  bool _isSettingMode = true;

  int _pickedHour = 0;
  int _pickedMin = 0;
  int _pickedSec = 0;

  void _startStopwatch() {
    if (_isRunning) return;

    setState(() {
      _isRunning = true;
      _isSettingMode = false;
      if (_elapsedMs == 0) {
        _elapsedMs =
            ((_pickedHour * 3600) + (_pickedMin * 60) + _pickedSec) * 1000;
      }
    });

    _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (mounted) {
        setState(() {
          _elapsedMs += 100;
        });
      }
    });
  }

  void _stopStopwatch() {
    _timer?.cancel();
    setState(() => _isRunning = false);
  }

  void _resetStopwatch() {
    _stopStopwatch();
    setState(() {
      _elapsedMs = 0;
      _isSettingMode = true;
      _pickedHour = 0;
      _pickedMin = 0;
      _pickedSec = 0;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Sesuaikan warna aplikasi kamu
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text('Stopwatch Pro',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
          const SizedBox(height: 40),
          // Bagian Display (Set Mode vs Running Mode)
          Expanded(
            flex: 3,
            child: _isSettingMode ? _buildTimePicker() : _buildTimeDisplay(),
          ),

          // Bagian Tombol Bulat ala iPhone tapi warna aplikasi kamu
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildRoundButton(
                    onTap: _resetStopwatch,
                    label: "Reset",
                    backgroundColor: Colors.grey.shade200, // Abu-abu muda
                    textColor: Colors.black,
                  ),
                  _buildRoundButton(
                    onTap: _isRunning ? _stopStopwatch : _startStopwatch,
                    label: _isRunning ? "Stop" : "Start",
                    backgroundColor:
                        _isRunning ? Colors.grey.shade100 : Colors.black,
                    textColor: _isRunning ? Colors.redAccent : Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimePicker() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Set Waktu Mulai",
            style: TextStyle(color: Colors.grey, fontSize: 16)),
        const SizedBox(height: 10),
        SizedBox(
          height: 180,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _pickerCol("jam", 24, (v) => _pickedHour = v),
              _pickerCol("menit", 60, (v) => _pickedMin = v),
              _pickerCol("detik", 60, (v) => _pickedSec = v),
            ],
          ),
        ),
      ],
    );
  }

  Widget _pickerCol(String label, int max, ValueChanged<int> onSelect) {
    return Expanded(
      child: CupertinoPicker(
        itemExtent: 38,
        onSelectedItemChanged: onSelect,
        children: List.generate(
            max,
            (i) => Center(
                child: Text("$i $label",
                    style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black)))), // Teks hitam di picker
      ),
    );
  }

  Widget _buildTimeDisplay() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Waktu Berjalan",
              style: TextStyle(color: Colors.grey, fontSize: 16)),
          const SizedBox(height: 10),
          Text(
            _controller.formatWaktu(_elapsedMs),
            style: const TextStyle(
                fontSize: 64,
                fontWeight: FontWeight.w200, // Tipis ala iPhone
                letterSpacing: -2,
                color: Colors.black // Teks hitam sesuai tema kamu
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildRoundButton(
      {required VoidCallback onTap,
      required String label,
      required Color backgroundColor,
      required Color textColor}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: backgroundColor,
          border: Border.all(color: Colors.grey.withOpacity(0.2), width: 1),
        ),
        child: Center(
          child: Text(label,
              style: TextStyle(
                  color: textColor, fontWeight: FontWeight.bold, fontSize: 16)),
        ),
      ),
    );
  }
}
