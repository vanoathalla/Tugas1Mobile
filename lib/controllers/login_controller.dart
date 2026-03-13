class LoginController {
  // Fungsi ini bertugas mengecek apakah kredensial yang dimasukkan valid
  bool validasiLogin(String username, String password) {
    if (username == 'admin' && password == 'admin') {
      return true; // Login sukses
    } else {
      return false; // Login gagal
    }
  }
}