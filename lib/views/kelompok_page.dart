import 'package:flutter/material.dart';
import '../models/data_kelompok.dart'; // <-- Tambahin baris ini bre

class KelompokPage extends StatelessWidget {
  const KelompokPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Data Kelompok')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Data Kelompok!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 16),
          
          // Looping data sekarang ngambil dari folder models
          ...dataKelompok.map((anggota) => 
            _buildMemberCard(anggota.nama, anggota.nim, anggota.color)
          ),
        ],
      ),
    );
  }

  Widget _buildMemberCard(String nama, String nim, Color color) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Colors.white,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        leading: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Icon(Icons.person_outline, color: color),
        ),
        title: Text(
          nama,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        subtitle: Text(
          nim,
          style: const TextStyle(color: Colors.blueGrey, fontSize: 14),
        ),
      ),
    );
  }
}