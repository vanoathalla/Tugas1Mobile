import 'package:flutter/material.dart';

class KelompokPage extends StatelessWidget {
  const KelompokPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Data Kelompok'),
        backgroundColor: Colors.teal[700],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildMemberCard('Danang', 'NIM: 123230'),
          _buildMemberCard('Gorga', 'NIM: 123230'),
          _buildMemberCard('Revano', 'NIM: 123230145'),
          _buildMemberCard('Jepskuy', 'NIM: 123230'),
        ],
      ),
    );
  }

  Widget _buildMemberCard(String nama, String nim) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.orange[300],
          child: const Icon(Icons.person, color: Colors.white),
        ),
        title: Text(nama, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(nim),
      ),
    );
  }
}
