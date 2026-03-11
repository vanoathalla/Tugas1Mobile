import 'package:flutter/material.dart';

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
          _buildMemberCard('Danang Adiwibowo', 'NIM: 123230143', Colors.teal),
          _buildMemberCard(
            'Gorga Doli Liberto Napitupulu',
            'NIM: 123230147',
            Colors.blue,
          ),
          _buildMemberCard(
            'R. Revano Athalla K',
            'NIM: 123230150',
            Colors.orange,
          ),
          _buildMemberCard('Narindera Jati P', 'NIM: 123230153', Colors.red),
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
