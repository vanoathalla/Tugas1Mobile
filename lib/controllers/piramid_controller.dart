class PiramidController {
  // Menghitung Luas Permukaan
  double hitungLuas(double sisi, double tinggiTegak) {
    return (sisi * sisi) + (2 * sisi * tinggiTegak);
  }

  // Menghitung Volume
  double hitungVolume(double sisi, double tinggi) {
    return (1 / 3) * (sisi * sisi) * tinggi;
  }
}
