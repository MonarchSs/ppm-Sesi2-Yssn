import 'package:flutter/material.dart';

// ====== DATA MAHASISWA (ubah sesuai kebutuhan) ======
const String kNama = 'Yassin N';
const String kNim = '20240040127';
const String kProdi = 'Teknik Informatika';
const String kKelas = 'PPM Sesi 2';

void main() => runApp(const MyApp());

/// Format angka menjadi Rupiah, contoh: 150000 -> Rp 150.000
String rupiah(int value) {
  final s = value.toString();
  final buf = StringBuffer();
  for (var i = 0; i < s.length; i++) {
    if (i > 0 && (s.length - i) % 3 == 0) buf.write('.');
    buf.write(s[i]);
  }
  return 'Rp $buf';
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product & Profile',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        scaffoldBackgroundColor: Colors.indigo.shade50,
      ),
      home: const HomePage(),
    );
  }
}

/// Halaman utama (Scaffold + AppBar)
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: scheme.primary,
        foregroundColor: scheme.onPrimary,
        title: const Text(
          'PPM Sesi 2 - $kNama ($kNim)',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            PromoBanner(),
            SizedBox(height: 16),
            ProfileCard(),
            SizedBox(height: 16),
            ProductCard(),
          ],
        ),
      ),
    );
  }
}

/// Banner promo sederhana: Stack + Positioned
class PromoBanner extends StatelessWidget {
  const PromoBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: const LinearGradient(
          colors: [Colors.deepOrange, Colors.amber],
        ),
      ),
      child: Stack(
        children: [
          const Positioned(
            right: -10,
            bottom: -10,
            child: Icon(Icons.local_offer, size: 110, color: Colors.white30),
          ),
          Positioned(
            top: 12,
            right: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.red.shade900,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'DISKON 20%',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12),
              ),
            ),
          ),
          const Positioned(
            left: 16,
            bottom: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('PROMO AKHIR TAHUN',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold)),
                Text('Belanja hemat, kualitas terbaik!',
                    style: TextStyle(color: Colors.white, fontSize: 13)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Kartu profil mahasiswa: StatelessWidget
class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              radius: 36,
              backgroundColor: scheme.primaryContainer,
              child: Icon(Icons.person, size: 44, color: scheme.primary),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(kNama,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  const Text('NIM: $kNim'),
                  const Text('Prodi/Kelas: $kProdi / $kKelas'),
                  const SizedBox(height: 8),
                  Row(
                    children: List.generate(
                      5,
                      (_) => const Icon(Icons.star, color: Colors.amber),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Kartu produk: StatefulWidget
class ProductCard extends StatefulWidget {
  const ProductCard({super.key});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  static const String _namaProduk = 'Headphone Wireless Pro';
  static const String _kategori = 'Elektronik';
  static const int _harga = 150000;

  bool _isFavorite = false;
  int _likeCount = 12;
  int _quantity = 1;

  int get _total => _harga * _quantity;

  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
      _likeCount += _isFavorite ? 1 : -1;
    });
  }

  void _decrease() {
    if (_quantity > 1) setState(() => _quantity--);
  }

  void _increase() => setState(() => _quantity++);

  void _addToCart() {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text('$_quantity x $_namaProduk ditambahkan ke keranjang'),
          behavior: SnackBarBehavior.floating,
          duration: const Duration(seconds: 2),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Card(
      elevation: 4,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Placeholder gambar produk
          Container(
            height: 160,
            width: double.infinity,
            color: scheme.primaryContainer,
            child: Icon(Icons.headphones, size: 90, color: scheme.primary),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Expanded(
                      child: Text(_namaProduk,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                    // Tombol Favorite + jumlah like
                    IconButton(
                      onPressed: _toggleFavorite,
                      tooltip: 'Favorite',
                      icon: Icon(
                        _isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: Colors.red,
                      ),
                    ),
                    Text('$_likeCount',
                        style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 6),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: scheme.secondaryContainer,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text('Kategori: $_kategori',
                      style: TextStyle(fontSize: 12)),
                ),
                Text('Harga: ${rupiah(_harga)}',
                    style: const TextStyle(fontSize: 16)),
                const SizedBox(height: 12),
                // Atur jumlah produk
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Jumlah:', style: TextStyle(fontSize: 16)),
                    Row(
                      children: [
                        IconButton.filledTonal(
                          onPressed: _quantity > 1 ? _decrease : null,
                          icon: const Icon(Icons.remove),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          child: Text('$_quantity',
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                        ),
                        IconButton.filledTonal(
                          onPressed: _increase,
                          icon: const Icon(Icons.add),
                        ),
                      ],
                    ),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Total:', style: TextStyle(fontSize: 16)),
                    Text(rupiah(_total),
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: scheme.primary)),
                  ],
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: _addToCart,
                    icon: const Icon(Icons.shopping_cart),
                    label: const Text('Tambah ke Keranjang'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
