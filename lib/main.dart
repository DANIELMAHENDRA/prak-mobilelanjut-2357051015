import 'package:flutter/material.dart';
import 'screens/login_screen.dart'; // Asumsi lokasi file
import 'screens/signup_screen.dart'; // Asumsi lokasi file
import 'screens/dashboard_screen.dart';
void main() => runApp(const JustduitApp());

class JustduitApp extends StatelessWidget {
  const JustduitApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Justduit',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF3F6F8), // abu-abu muda
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1E88FF)),
        inputDecorationTheme: InputDecorationTheme(
          isDense: true,
          fillColor: Colors.white,
          filled: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFF1E88FF)),
          ),
        ), // // InputDecorationTheme
      ), // // ThemeData
      initialRoute: LoginScreen.route, // default = Sign In
      routes: {
        // '/': (context) => const LoginScreen(), // jika menggunakan '/'
        LoginScreen.route: (context) => const LoginScreen(),
        SignupScreen.route: (context) => const SignupScreen(),
        DashboardScreen.route:(context) => const DashboardScreen(),
      },
    );
  }
}