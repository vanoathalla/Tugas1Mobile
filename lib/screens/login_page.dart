import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    // Validasi super simpel nih Mon, asalkan diisi "admin" dua-duanye bisa masuk
    if (_usernameController.text == 'admin' &&
        _passwordController.text == 'admin') {
      // Pindah ke halaman dashboard dan hapus history login biar ga bisa di-back
      Navigator.pushReplacementNamed(context, '/dashboard');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Username atau Password salah ye! Coba pake "admin"'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[700],
      body: Center(
        child: SingleChildScrollView(
          child: Card(
            margin: const EdgeInsets.all(24.0),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Login User',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _passwordController,
                    obscureText: true, // Biar passwordnye jadi bintang-bintang
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: _login,
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: Colors.teal[800],
                    ),
                    child: const Text('Log In'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
