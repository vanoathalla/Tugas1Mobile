class AnggotaKelompok {
  final String nama;
  final String nim;
  final String imagePath; 

  AnggotaKelompok({
    required this.nama,
    required this.nim,
    required this.imagePath,
  });
}

List<AnggotaKelompok> dataKelompok = [
  AnggotaKelompok(
    nama: 'Danang Adiwibowo', 
    nim: 'NIM: 123230143', 
    imagePath: 'assets/images/danang.jpeg', 
  ),
  AnggotaKelompok(
    nama: 'Gorga Doli Liberto Napitupulu', 
    nim: 'NIM: 123230147', 
    imagePath: 'assets/images/gorga.jpeg',
  ),
  AnggotaKelompok(
    nama: 'R. Revano Athalla K', 
    nim: 'NIM: 123230150', 
    imagePath: 'assets/images/vano.jpeg',
  ),
  AnggotaKelompok(
    nama: 'Narindera Jati P', 
    nim: 'NIM: 123230153', 
    imagePath: 'assets/images/jepe.jpeg',
  ),
];