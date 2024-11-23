import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text(
          'iJASA',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
          GestureDetector(
            onTap: () {
              debugPrint(
                  "Navigating to ProfilePage..."); // Menambah log untuk memverifikasi bahwa tombol ditekan
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            },
            child: const CircleAvatar(
              backgroundImage: AssetImage('assets/profile_image.png'),
              radius: 18,
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[200],
                hintText: 'Apa yang dibutuhkan?',
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // Section Title
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Kebutuhan Teratas',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Grid View of Cards
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.8,
              ),
              itemCount: services.length,
              itemBuilder: (context, index) {
                final service = services[index];
                return ServiceCard(
                  image: service['image']!,
                  title: service['title']!,
                  price: service['price']!,
                  onTap: () {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final VoidCallback onTap;

  const ServiceCard({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: Image.asset(
                image,
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              price,
              style: const TextStyle(
                color: Colors.deepPurple,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Dummy data for services
final List<Map<String, String>> services = [
  {
    'image': 'assets/laundry.jpg',
    'title': 'Laundry Cuci Bersih Setrika',
    'price': 'Rp. 10.000',
  },
  {
    'image': 'assets/art.jpg',
    'title': 'Asisten Rumah Tangga',
    'price': 'Rp. 20.000',
  },
  {
    'image': 'assets/tukangkebun.png',
    'title': 'Tukang Kebun',
    'price': 'Rp. 20.000',
  },
  {
    'image': 'assets/chef.jpg',
    'title': 'Tukang Masak',
    'price': 'Rp. 20.000',
  },
  {
    'image': 'assets/servistv.jpg',
    'title': 'Tukang Servis',
    'price': 'Rp. 15.000',
  },
  {
    'image': 'assets/montir.jpg',
    'title': 'Montir',
    'price': 'Rp. 30.000',
  },
];

// Halaman profil
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
