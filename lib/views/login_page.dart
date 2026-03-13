import 'package:flutter/material.dart';
import 'dashboard_page.dart';
import '../controllers/login_controller.dart'; // Import controllernya

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  // Inisialisasi Controller
  final LoginController _controller = LoginController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login({required String username, required String password}) {
    // View bertanya ke Controller apakah loginnya valid
    bool isLoginValid = _controller.validasiLogin(username, password);

    if (isLoginValid) {
      // Jika true, View bertugas melakukan navigasi
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DashboardPage()),
      );
    } else {
      // Jika false, View bertugas menampilkan notifikasi gagal
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text("Login gagal! Username atau Password salah ye!"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30.0),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Icon(
                  Icons.dashboard_customize_outlined,
                  size: 100,
                  color: Colors.blueGrey[800],
                ),
                const SizedBox(height: 10),
                const Text(
                  'Tugas Mobile App',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w900,
                    color: Colors.black87,
                  ),
                ),
                const Text(
                  'Pemrograman Aplikasi Mobile',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
                const SizedBox(height: 50),

                // Helper widget untuk input username
                _loginField(
                  label: "Username",
                  icon: Icons.person_outline,
                  inputController: _usernameController,
                ),
                const SizedBox(height: 16),

                // Helper widget untuk input password
                _loginField(
                  label: "Password",
                  icon: Icons.lock_outline,
                  inputController: _passwordController,
                  isPassword: _obscurePassword,
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: Colors.blueGrey,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),

                const SizedBox(height: 32),

                ElevatedButton(
                  onPressed: () {
                    _login(
                      username: _usernameController.text,
                      password: _passwordController.text,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey[900],
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 2,
                  ),
                  child: const Text(
                    'Log In',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Lupa Kata Sandi?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Fungsi helper untuk Textfield (TIDAK DIUBAH SAMA SEKALI)
  Widget _loginField({
    required String label,
    required IconData icon,
    required TextEditingController inputController,
    bool isPassword = false,
    Widget? suffixIcon,
  }) {
    return TextField(
      controller: inputController,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.blueGrey),
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: const Color(0xFFECEFF1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.blueGrey, width: 2),
        ),
      ),
    );
  }
}
