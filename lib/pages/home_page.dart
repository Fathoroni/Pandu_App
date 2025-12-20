import 'package:flutter/material.dart';
import 'kelas_page.dart';
import 'notifikasi_page.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    _HomeDashboard(),
    KelasPage(),
    NotifikasiPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _widgetOptions.elementAt(_selectedIndex)),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          child: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                icon: Icon(Icons.school),
                label: 'Kelas Saya',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                label: 'Notifikasi',
              ),
            ],
            currentIndex: _selectedIndex < 3
                ? _selectedIndex
                : 0, // Profile isn't in bottom nav in ref image, but keeping logic safe
            backgroundColor: const Color(0xFFB71C1C), // Deep Red
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.white60,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              // If index is 3 (Profile), we might want to handle it differently
              // but for now let's map it to the tab switching logic if we keep 4 tabs
              // The requirements say: Home, Kelas Saya, Notifikasi.
              // So I will limit the bottom nav to 3 items as per requirement.
              if (index < 3) {
                _onItemTapped(index);
              }
            },
          ),
        ),
      ),
    );
  }
}

class _HomeDashboard extends StatelessWidget {
  const _HomeDashboard();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Custom App Bar / Header
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          decoration: const BoxDecoration(
            color: Color(0xFFB71C1C), // Deep Red
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Hallo,',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  Text(
                    'FATHORONI', // Static name as per mockup
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white),
                ),
                child: Row(
                  children: const [
                    Text(
                      'MAHASISWA',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8),
                    Icon(Icons.person, color: Colors.white, size: 20),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Scrollable Content
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(24.0),
            children: [
              // Tugas Yang Akan Datang Section
              const Text(
                'Tugas Yang Akan Datang',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFB71C1C),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Tugas 01 - UID Android Mobile Game',
                      style: TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: Column(
                        children: const [
                          Text(
                            'Waktu Pengumpulan',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Jumat 26 Februari, 23:59 WIB',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Pengumuman Terakhir Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Pengumuman Terakhir',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text('Lihat Semua', style: TextStyle(color: Colors.blue)),
                ],
              ),
              const SizedBox(height: 12),
              const Text('Maintenance Pra UAS Semester Genap 2020/2021'),
              const SizedBox(height: 8),
              // Placeholder for Announcement Banner
              Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Icon(Icons.image, size: 50, color: Colors.blue),
                ),
              ),

              const SizedBox(height: 24),

              // Progres Kelas Section
              const Text(
                'Progres Kelas',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),

              _buildProgressItem(
                color: Colors.amber,
                title:
                    'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA D4SM-42-03 [ADY]',
                progress: 0.8,
                label: 'UI/UX',
              ),
              _buildProgressItem(
                color: Colors.red,
                title: 'KEWARGANEGARAAN D4SM-41-GAB1 [BBO], JUMAT 2',
                progress: 0.6,
                label: 'PKN',
              ),
              _buildProgressItem(
                color: Colors.purple,
                title: 'SISTEM OPERASI D4SM-44-02 [DDS]',
                progress: 0.5,
                label: 'OS',
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildProgressItem({
    required Color color,
    required String title,
    required double progress,
    required String label,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                label,
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '2021/2',
                  style: TextStyle(fontSize: 10, color: Colors.grey[600]),
                ),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 8,
                    backgroundColor: Colors.grey[300],
                    color: const Color(0xFFB71C1C),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${(progress * 100).toInt()}% Selesai',
                  style: const TextStyle(fontSize: 12, color: Colors.black54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
