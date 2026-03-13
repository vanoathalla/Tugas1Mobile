class BilanganController {
  // Kita pakai Map<String, String> biar bisa ngembaliin 2 teks jawaban sekaligus
  Map<String, String> cekBilangan(String inputText) {
    int? angka = int.tryParse(inputText);
    
    // Kalau input kosong atau bukan angka
    if (angka == null) {
      return {
        'ganjilGenap': 'Masukin angka yang bener ye!',
        'prima': '',
      };
    }

    // 1. Logic Cek Ganjil Genap
    String ganjilGenap = (angka % 2 == 0) ? 'Genap' : 'Ganjil';

    // 2. Logic Cek Prima (Algoritma efisien yang udah kita benerin)
    bool isPrima = true;
    if (angka <= 1) {
      isPrima = false; 
    } else if (angka == 2) {
      isPrima = true; 
    } else if (angka % 2 == 0) {
      isPrima = false; 
    } else {
      for (int i = 3; i * i <= angka; i += 2) {
        if (angka % i == 0) {
          isPrima = false;
          break;
        }
      }
    }

    String prima = isPrima ? 'Prima' : 'Bukan Prima';

    // Return hasilnya ke View
    return {
      'ganjilGenap': 'Angka $angka adalah $ganjilGenap',
      'prima': 'Dan $prima',
    };
  }
}