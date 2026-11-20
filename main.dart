import 'package:flutter/material.dart';

void main() {
  runApp(const LokaventureApp());
}

class LokaventureApp extends StatelessWidget {
  const LokaventureApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lokaventure - Wisata Cianjur',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const BerandaWisataPage(),
    );
  }
}

// Model Data Wisata
class Wisata {
  final String id;
  final String nama;
  final String kategori;
  final String lokasi;
  final String hargaTiket;
  final String deskripsi;
  final IconData ikon;
  final Color warnaKartu;

  Wisata({
    required this.id,
    required this.nama,
    required this.kategori,
    required this.lokasi,
    required this.hargaTiket,
    required this.deskripsi,
    required this.ikon,
    required this.warnaKartu,
  });
}

// Data Dummy Wisata Cianjur
final List<Wisata> daftarWisataCianjur = [
  Wisata(
    id: 'W01',
    nama: 'Situs Megalitikum Gunung Padang',
    kategori: 'Wisata Sejarah',
    lokasi: 'Campaka, Cianjur',
    hargaTiket: 'Rp 10.000',
    deskripsi:
        'Situs prasejarah peninggalan kebudayaan Megalitikum terbesar di Asia Tenggara yang terletak di perbatasan Dusun Gunungpadang dan Panggulan.',
    ikon: Icons.landscape,
    warnaKartu: Colors.teal.shade700,
  ),
  Wisata(
    id: 'W02',
    nama: 'Kebun Raya Cibodas',
    kategori: 'Wisata Alam',
    lokasi: 'Cipanas, Cianjur',
    hargaTiket: 'Rp 15.500',
    deskripsi:
        'Taman hijau luas di kaki Gunung Gede Pangrango dengan koleksi tanaman langka, taman sakura, rumah kaca, dan air terjun yang sejuk.',
    ikon: Icons.park,
    warnaKartu: Colors.green.shade700,
  ),
  Wisata(
    id: 'W03',
    nama: 'Curug Citambur',
    kategori: 'Wisata Air Terjun',
    lokasi: 'Pasirkuda, Cianjur Selatan',
    hargaTiket: 'Rp 10.000',
    deskripsi:
        'Air terjun dengan ketinggian sekitar 130 meter yang dikelilingi tebing hijau dan kabut tipis khas dataran tinggi Cianjur Selatan.',
    ikon: Icons.water_drop,
    warnaKartu: Colors.blue.shade700,
  ),
  Wisata(
    id: 'W04',
    nama: 'Pantai Jayanti',
    kategori: 'Wisata Bahari',
    lokasi: 'Cidaun, Cianjur Selatan',
    hargaTiket: 'Rp 5.000',
    deskripsi:
        'Pantai eksotis di pesisir selatan Cianjur yang berdampingan dengan Cagar Alam Bojonglarang dan pelabuhan nelayan tradisional.',
    ikon: Icons.beach_access,
    warnaKartu: Colors.cyan.shade700,
  ),
  Wisata(
    id: 'W05',
    nama: 'Taman Bunga Nusantara',
    kategori: 'Wisata Edukasi',
    lokasi: 'Sukaresmi, Cianjur',
    hargaTiket: 'Rp 50.000',
    deskripsi:
        'Taman display bunga seluas 35 hektare dengan berbagai tema taman dunia seperti Taman Jepang, Taman Prancis, dan Labirin.',
    ikon: Icons.local_florist,
    warnaKartu: Colors.orange.shade700,
  ),
  Wisata(
    id: 'W06',
    nama: 'Waduk Jangari (Calincing)',
    kategori: 'Wisata Kuliner & Air',
    lokasi: 'Mande, Cianjur',
    hargaTiket: 'Rp 10.000',
    deskripsi:
        'Destinasi perairan bagian dari Waduk Cirata yang terkenal dengan wisata perahu dan rumah makan terapung ikan bakar.',
    ikon: Icons.directions_boat,
    warnaKartu: Colors.indigo.shade700,
  ),
];

class BerandaWisataPage extends StatefulWidget {
  const BerandaWisataPage({super.key});

  @override
  State<BerandaWisataPage> createState() => _BerandaWisataPageState();
}

class _BerandaWisataPageState extends State<BerandaWisataPage> {
  // State untuk menentukan tampilan List (false) atau Grid (true)
  bool isGridView = false;

  // Fungsi navigasi ke halaman detail
  void _bukaHalamanDetail(Wisata wisata) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailWisataPage(wisata: wisata),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Lokaventure',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text(
              'Pesona Wisata Tatar Santri Cianjur',
              style: TextStyle(fontSize: 12, color: Colors.white70),
            ),
          ],
        ),
        actions: [
          // Tombol Toggle antara List View dan Grid View
          IconButton(
            tooltip: isGridView ? 'Ubah ke Tampilan List' : 'Ubah ke Tampilan Grid',
            icon: Icon(isGridView ? Icons.view_list : Icons.grid_view),
            onPressed: () {
              setState(() {
                isGridView = !isGridView;
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Banner informasi wisata
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(12),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.amber.shade50,
              border: Border.all(color: Colors.amber.shade400),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.info_outline, color: Colors.amber, size: 22),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Jelajahi Wisata Cianjur',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Temukan beragam destinasi alam, sejarah, dan bahari di Cianjur.',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 12,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Indikator Mode Tampilan Aktif
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Daftar Destinasi (${daftarWisataCianjur.length})',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Chip(
                  label: Text(
                    isGridView ? 'Mode: Grid View' : 'Mode: List View',
                    style: const TextStyle(fontSize: 12),
                  ),
                  backgroundColor: Colors.teal.shade50,
                ),
              ],
            ),
          ),

          // Konten Utama: Tampilan Grid atau List
          Expanded(
            child: isGridView ? _buildGridView() : _buildListView(),
          ),
        ],
      ),
    );
  }

  // Widget untuk Tampilan LIST
  Widget _buildListView() {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: daftarWisataCianjur.length,
      itemBuilder: (context, index) {
        final item = daftarWisataCianjur[index];
        return Card(
          elevation: 2,
          margin: const EdgeInsets.only(bottom: 12),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          // InkWell membuat item dapat diklik dengan efek riak (ripple)
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () => _bukaHalamanDetail(item),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: item.warnaKartu,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(item.ikon, color: Colors.white, size: 32),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.nama,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          item.lokasi,
                          style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Tiket: ${item.hargaTiket}',
                          style: const TextStyle(
                            color: Colors.teal,
                            fontWeight: FontWeight.w600,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.chevron_right, color: Colors.grey),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  // Widget untuk Tampilan GRID
  Widget _buildGridView() {
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 2 kolom
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.85,
      ),
      itemCount: daftarWisataCianjur.length,
      itemBuilder: (context, index) {
        final item = daftarWisataCianjur[index];
        return Card(
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          // InkWell juga dipasang pada item Grid agar bisa diklik ke halaman detail
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () => _bukaHalamanDetail(item),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    decoration: BoxDecoration(
                      color: item.warnaKartu,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(12),
                      ),
                    ),
                    child: Icon(item.ikon, color: Colors.white, size: 44),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item.nama,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.lokasi,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 12,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              item.hargaTiket,
                              style: const TextStyle(
                                color: Colors.teal,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// HALAMAN DETAIL WISATA
class DetailWisataPage extends StatelessWidget {
  final Wisata wisata;

  const DetailWisataPage({super.key, required this.wisata});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(wisata.nama),
        backgroundColor: wisata.warnaKartu,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Ilustrasi Destinasi
            Container(
              width: double.infinity,
              height: 200,
              color: wisata.warnaKartu,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(wisata.ikon, size: 80, color: Colors.white),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      wisata.kategori,
                      style: const TextStyle(color: Colors.white, fontSize: 13),
                    ),
                  ),
                ],
              ),
            ),

            // Informasi Detail
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    wisata.nama,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const Icon(Icons.location_on, color: Colors.redAccent, size: 20),
                      const SizedBox(width: 6),
                      Text(
                        wisata.lokasi,
                        style: const TextStyle(fontSize: 15, color: Colors.black87),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.confirmation_number, color: Colors.teal, size: 20),
                      const SizedBox(width: 6),
                      Text(
                        'Harga Tiket Masuk: ${wisata.hargaTiket}',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.teal,
                        ),
                      ),
                    ],
                  ),
                  const Divider(height: 32),
                  const Text(
                    'Deskripsi Destinasi',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    wisata.deskripsi,
                    style: const TextStyle(fontSize: 15, height: 1.5),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: wisata.warnaKartu,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.arrow_back),
                      label: const Text('Kembali ke Daftar Wisata'),
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