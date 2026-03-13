import 'package:flutter/material.dart';

class AnggotaKelompok {
  final String nama;
  final String nim;
  final Color color;

  AnggotaKelompok({
    required this.nama,
    required this.nim,
    required this.color,
  });
}

// Data kelompok dipindah ke sini semua
List<AnggotaKelompok> dataKelompok = [
  AnggotaKelompok(
    nama: 'Danang Adiwibowo', 
    nim: 'NIM: 123230143', 
    color: Colors.teal,
  ),
  AnggotaKelompok(
    nama: 'Gorga Doli Liberto Napitupulu', 
    nim: 'NIM: 123230147', 
    color: Colors.blue,
  ),
  AnggotaKelompok(
    nama: 'Raden Revano Athalla K', 
    nim: 'NIM: 123230150', 
    color: Colors.orange,
  ),
  AnggotaKelompok(
    nama: 'Narindera Jati Panuntun', 
    nim: 'NIM: 123230153', 
    color: Colors.red,
  ),
];