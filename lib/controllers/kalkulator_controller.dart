class KalkulatorController {
  // Fungsi ini bertugas memproses input teks menjadi angka dan menghitungnya
  String hitung(String angka1Text, String angka2Text, String operasi) {
    double angka1 = double.tryParse(angka1Text) ?? 0;
    double angka2 = double.tryParse(angka2Text) ?? 0;
    double hasilHitung = 0;

    if (operasi == '+') {
      hasilHitung = angka1 + angka2;
    } else if (operasi == '-') {
      hasilHitung = angka1 - angka2;
    }

    // Mengembalikan hasil dalam bentuk teks agar siap ditampilkan oleh View
    return hasilHitung.toString();
  }
}