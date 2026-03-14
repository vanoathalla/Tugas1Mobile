class LoginController {
  bool validasiLogin(String username, String password) {
    if (username == 'admin' && password == 'admin') {
      return true;
    } else {
      return false;
    }
  }
}
