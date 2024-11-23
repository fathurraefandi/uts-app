import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilPage(),
    );
  }
}

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title:
            const Text('iJASA', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/profile_image.png'),
            ),
            const SizedBox(height: 10),
            const Text(
              'Sarah Clair',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 20),
            ProfileOption(
              title: 'Alamat',
              subtitle: 'Atur alamat anda',
              onTap: () {},
            ),
            ProfileOption(
              title: 'Rekening Bank',
              subtitle: 'Daftar rekening bank',
              onTap: () {},
            ),
            ProfileOption(
              title: 'Pembayaran Instan',
              subtitle: 'E-Wallet, Kartu kredit',
              onTap: () {},
            ),
            ProfileOption(
              title: 'Keamanan Akun',
              subtitle: 'Kata sandi, PIN & Verifikasi data diri',
              onTap: () {},
            ),
            ProfileOption(
              title: 'Notifikasi',
              subtitle: 'Atur notifikasi aplikasi',
              onTap: () {},
            ),
            ProfileOption(
              title: 'Privasi Akun',
              subtitle: 'Atur penggunaan data pribadi',
              onTap: () {},
            ),
            ProfileOption(
              title: 'Log out',
              subtitle: '',
              onTap: () {},
              showSubtitle: false,
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileOption extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final bool showSubtitle;

  const ProfileOption({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.showSubtitle = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          border: const Border(
            bottom: BorderSide(color: Colors.grey, width: 0.5),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                  if (showSubtitle) const SizedBox(height: 5),
                  if (showSubtitle)
                    Text(
                      subtitle,
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
