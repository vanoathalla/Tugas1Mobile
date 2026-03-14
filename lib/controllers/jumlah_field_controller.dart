class JumlahFieldController {
  String hitungTotal(String inputText) {
    List<String> angkaString = inputText.split(RegExp(r'[,\s]+'));

    int total = 0;

    for (var str in angkaString) {
      if (str.isNotEmpty) {
        total += int.tryParse(str) ?? 0;
      }
    }

    return total.toString();
  }
}
