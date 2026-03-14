class BilanganController {
  Map<String, String> cekBilangan(String inputText) {
    BigInt? angka = BigInt.tryParse(inputText);

    if (angka == null) {
      return {'ganjilGenap': 'Masukin angka yang bener ye!', 'prima': ''};
    }

    String ganjilGenap = angka.isEven ? 'Genap' : 'Ganjil';

    bool isPrima = true;
    if (angka <= BigInt.one) {
      isPrima = false;
    } else if (angka == BigInt.two) {
      isPrima = true;
    } else if (angka.isEven) {
      isPrima = false;
    } else {
      BigInt i = BigInt.from(3);
      while (i * i <= angka) {
        if (angka % i == BigInt.zero) {
          isPrima = false;
          break;
        }
        i += BigInt.two;
      }
    }

    String prima = isPrima ? 'Prima' : 'Bukan Prima';

    return {
      'ganjilGenap': 'Angka $angka adalah $ganjilGenap',
      'prima': 'Dan $prima',
    };
  }
}
