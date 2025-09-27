import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  static const String route = '/dashboard';
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: Colors.white,
        elevation: 1,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView( // supaya bisa discroll kalau isi panjang
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Selamat Datang,',
                style: TextStyle(fontSize: 18, color: Colors.grey[600]),
              ),
              const Text(
                'Daniel Okto Mahendra',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 24),

              // kartu saldo
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.15),
                      spreadRadius: 2,
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.account_balance_wallet_outlined,
                          color: Colors.grey[500],
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Saldo Saat Ini',
                          style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Rp 1.234.567',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1E88FF),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text('Lihat Detail Transaksi'),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // menu cepat
              const Text(
                'Menu Cepat',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _quickMenu(Icons.add_circle, 'Tambah'),
                  _quickMenu(Icons.history, 'Riwayat'),
                  _quickMenu(Icons.pie_chart, 'Laporan'),
                  _quickMenu(Icons.person, 'Profil'),
                ],
              ),

              const SizedBox(height: 24),

              // daftar transaksi terakhir
              const Text(
                'Transaksi Terakhir',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 12),
              _transactionItem('Beli Pulsa', '- Rp 50.000', Colors.red),
              _transactionItem('Gaji Bulanan', '+ Rp 5.000.000', Colors.green),
              _transactionItem('Makan Siang', '- Rp 25.000', Colors.red),
            ],
          ),
        ),
      ),

      // bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xFF1E88FF),
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.swap_horiz), label: 'Transaksi'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }

  // widget kecil untuk menu cepat
  static Widget _quickMenu(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: const Color(0xFF1E88FF).withOpacity(0.1),
          child: Icon(icon, size: 28, color: const Color(0xFF1E88FF)),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 13)),
      ],
    );
  }

  // widget kecil untuk item transaksi
  static Widget _transactionItem(String title, String amount, Color color) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundColor: color.withOpacity(0.1),
        child: Icon(Icons.monetization_on, color: color),
      ),
      title: Text(title),
      trailing: Text(
        amount,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
