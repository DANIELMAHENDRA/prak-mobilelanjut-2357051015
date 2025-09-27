import 'package:flutter/material.dart';
import 'signup_screen.dart'; // Asumsi file ini ada untuk navigasi
import 'dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  static const route = '/login';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _email = TextEditingController();
  final _pass = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _pass.dispose();
    super.dispose();
  }

  // Komponen untuk label wajib (required label)
  Widget requiredLabel(String text) => Row(
        children: [
          Text(text, style: const TextStyle(fontSize: 13)),
          const Text('*', style: TextStyle(color: Colors.red, fontSize: 13)),
        ],
      );

  // Komponen untuk tombol biru dengan gradient (UI-only)
  Widget primaryButton(String label, VoidCallback onTap) => GestureDetector(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: 46,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28),
            gradient: const LinearGradient(
              colors: [Color(0xFF1E88FF), Color(0xFF207DFF)],
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF1E88FF).withOpacity(0.25),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // logo
              Image.asset(
                'assets/logo-mola.png',
                fit: BoxFit.contain,
                height: 18, // Asumsi tinggi
              ),
              const SizedBox(height: 18),
              // judul
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Hi, Welcome Back to Justduit',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              // card form (dibangun manual)
              Container(
                width: 360, // Asumsi lebar
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.fromLTRB(
                  18,
                  18,
                  18,
                  22,
                ), // kiri,atas,kanan,bawah // EdgeInsets.fromLTRB
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 16,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    requiredLabel('Email Address'),
                    const SizedBox(height: 6),
                    TextField(
                      controller: _email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: 'Enter your email',
                      ),
                    ),
                    const SizedBox(height: 14),

                    requiredLabel('Password'),
                    const SizedBox(height: 6),
                    TextField(
                      controller: _pass,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: 'Enter your password',
                      ),
                    ),
                    const SizedBox(height: 8),

                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            padding: EdgeInsets.zero),
                        child: const Text(
                          'Forgot Password',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 6),

              primaryButton(
              'Sign In Now',() {
                if (_email.text.isEmpty || _pass.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                    content: Text('Email dan Password tidak boleh kosong!'),
                    backgroundColor: Colors.red,
                   ),
                  );
                  } else {
                     Navigator.pushNamedAndRemoveUntil(
                    context,
                    DashboardScreen.route,
                    (route) => false,
                    );
                  }
                },
              ),



              const SizedBox(height: 14),

              Center(
                child: TextButton(
                  onPressed: () => Navigator.pushNamed(context, SignupScreen.route),
                  child: const Text(
                    'Create New Account',
                    style: TextStyle(fontSize: 13),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}