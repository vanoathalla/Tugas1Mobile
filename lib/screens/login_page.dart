import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  void _login() {
    // Validasi super simpel nih Mon, asalkan diisi "admin" dua-duanye bisa masuk
    if (_usernameController.text == 'admin' &&
        _passwordController.text == 'admin') {
      // Pindah ke halaman dashboard dan hapus history login biar ga bisa di-back
      Navigator.pushReplacementNamed(context, '/dashboard');
    } else {
      // Alert dialog yang cakep
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: const Text('Login Gagal, Bhap!'),
          content: const Text(
            'Username atau Password salah ye! Coba pake "admin"',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Siap!',
                style: TextStyle(color: Colors.orange),
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Kite pake layout responsif
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30.0),
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              maxWidth: 400,
            ), // Biar ga kegedean di tablet
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Ilustrasi logo yang kalcer (pake icon aje biar simpel kodingan)
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
                    color: Colors.black800,
                  ),
                ),
                const Text(
                  'Pemrograman Aplikasi Mobile',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.black400),
                ),
                const SizedBox(height: 50),

                // Input username
                TextField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    prefixIcon: Icon(Icons.person_outline),
                  ),
                ),
                const SizedBox(height: 16),

                // Input password
                TextField(
                  controller: _passwordController,
                  obscureText:
                      _obscurePassword, // Biar passwordnye jadi bintang-bintang
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 32),

                // Tombol Log in
                ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey[900], // Sesuai tema modern
                  ),
                  child: const Text('Log In', style: TextStyle(fontSize: 18)),
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
}
