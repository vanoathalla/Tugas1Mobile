import 'package:flutter/material.dart';
import 'dart:async';
import '../controllers/stopwatch_controller.dart';

class StopwatchPage extends StatefulWidget {
  const StopwatchPage({super.key});

  @override
  State<StopwatchPage> createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {
  // Inisialisasi Controller
  final StopwatchController _controller = StopwatchController();
  Timer? _timer;

  void _startTimer() {
    _timer = Timer.periodic(const Duration(milliseconds: 30), (timer) {
      if (mounted) {
        setState(() {});
      }
    });
    _controller.start();
  }

  void _stopTimer() {
    _timer?.cancel();
    _controller.stop();
    setState(() {});
  }

  void _resetTimer() {
    _stopTimer();
    _controller.reset();
    setState(() {});
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Background putih bersih
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ), // Tombol back hitam
        title: const Text(
          'Stopwatch',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(Icons.timer_outlined, size: 64, color: Colors.black87),
            const SizedBox(height: 32),

            // Tampilan Waktu (Digital Display Minimalis)
            Container(
              padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade200, width: 1.5),
              ),
              child: Text(
                _controller.formatWaktu(_controller.elapsedMilliseconds),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 64,
                  fontWeight: FontWeight.w900,
                  fontFamily:
                      'monospace', // Font khusus angka biar lebarnya konsisten
                  color: Colors.black,
                  letterSpacing: -2.0,
                ),
              ),
            ),
            const SizedBox(height: 48),

            // Baris Tombol Start & Stop
            Row(
              children: [
                Expanded(
                  child: _buildActionButton(
                    label: 'Start',
                    icon: Icons.play_arrow_outlined,
                    isPrimary: true, // Warna hitam pekat
                    onPressed: _controller.isRunning ? null : _startTimer,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildActionButton(
                    label: 'Stop',
                    icon: Icons.pause_outlined,
                    isPrimary: true, // Warna hitam pekat
                    onPressed: _controller.isRunning ? _stopTimer : null,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Tombol Reset (Dibikin Full Width & Gaya Outline)
            _buildActionButton(
              label: 'Reset',
              icon: Icons.refresh_outlined,
              isPrimary: false, // Warna putih garis abu-abu
              onPressed: _resetTimer,
            ),
          ],
        ),
      ),
    );
  }

  // Helper fungsi tombol biar kodingannya rapi
  Widget _buildActionButton({
    required String label,
    required IconData icon,
    required bool isPrimary,
    required VoidCallback? onPressed,
  }) {
    return ElevatedButton.icon(
      icon: Icon(icon, size: 24),
      label: Text(
        label,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
        ),
      ),
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        // Kalau isPrimary true (hitam), kalau false (putih)
        backgroundColor: isPrimary ? Colors.black : Colors.white,
        foregroundColor: isPrimary ? Colors.white : Colors.black,

        // Warna kalau tombolnya lagi dimatiin (disabled)
        disabledBackgroundColor: Colors.grey.shade100,
        disabledForegroundColor: Colors.grey.shade400,

        padding: const EdgeInsets.symmetric(vertical: 18),
        elevation: 0, // Tanpa bayangan
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          // Kasih border kalau dia secondary (Reset) dan lagi bisa dipencet
          side: isPrimary || onPressed == null
              ? BorderSide.none
              : BorderSide(color: Colors.grey.shade300, width: 1.5),
        ),
      ),
    );
  }
}
