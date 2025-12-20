import 'package:flutter/material.dart';
import 'login_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Red Header Background
          Container(
            height: 320,
            decoration: const BoxDecoration(
              color: Color(0xFFB71C1C), // Deep Red
              // If curve is needed, add BorderRadius logic here similar to Login
            ),
          ),

          // Content
          Column(
            children: [
              // Custom Approx AppBar Area
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          // Logic to go back if needed, but this is a main tab
                          // In design ref it shows Back arrow.
                        },
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // Profile Avatar
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color:
                      Colors.red[900], // Darker red background for avatar hole
                  image: const DecorationImage(
                    image: AssetImage(
                      'assets/images/logo.png',
                    ), // Placeholder or User Avatar
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(color: Colors.transparent, width: 0),
                ),
              ),

              const SizedBox(height: 16),

              // Name
              const Text(
                'FATHORONI', // User name from Home Page context
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 1.0,
                ),
              ),

              const SizedBox(height: 24),

              // Floating Tab Card
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
                  child: TabBar(
                    controller: _tabController,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.black,
                    indicatorColor: Colors.grey,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorWeight: 3,
                    labelStyle: const TextStyle(fontWeight: FontWeight.w500),
                    tabs: const [
                      Tab(text: 'About Me'),
                      Tab(text: 'Kelas'),
                      Tab(text: 'Edit Profile'),
                    ],
                  ),
                ),
              ),

              // Tab View Content
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildAboutMeTab(context),
                    _buildKelasTab(),
                    _buildEditProfileTab(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAboutMeTab(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Informasi User',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildInfoItem(
            'Email address',
            'fathoroni@365.telkomuniversity.ac.id',
          ),
          const SizedBox(height: 16),
          _buildInfoItem('Program Studi', 'D4 Teknologi Rekayasa Multimedia'),
          const SizedBox(height: 16),
          _buildInfoItem('Fakultas', 'FIT'),

          const SizedBox(height: 32),

          const Text(
            'Aktivitas Login',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildInfoItem(
            'First access to site',
            'Monday, 7 September 2020, 9:27 AM (288 days 12 hours)',
          ),
          const SizedBox(height: 16),
          _buildInfoItem(
            'Last access to site',
            'Tuesday, 22 June 2021, 9:44 PM (now)',
          ),

          const SizedBox(height: 48),

          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              icon: const Icon(Icons.logout, color: Colors.white),
              label: const Text(
                'Log Out',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFB71C1C),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: Colors.black87),
        ),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(fontSize: 14, color: Colors.black)),
      ],
    );
  }

  Widget _buildKelasTab() {
    final List<Map<String, String>> classes = [
      {
        'title': 'BAHASA INGGRIS: BUSINESS AND SCIENTIFIC\nD4SM-41-GAB1 [ARS]',
        'date': 'Monday, 8 February 2021',
      },
      {
        'title': 'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA\nD4SM-42-03 [ADY]',
        'date': 'Monday, 8 February 2021',
      },
      {
        'title': 'KEWARGANEGARAAN\nD4SM-41-GAB1 [BBO]. JUMAT 2',
        'date': 'Monday, 8 February 2021',
      },
      {
        'title': 'OLAH RAGA D3TT-44-02 [EYR]',
        'date': 'Monday, 8 February 2021',
      },
      {
        'title':
            'PEMROGRAMAN PERANGKAT BERGERAK MULTIMEDIA\nD4SM-41-GAB1 [APJ]',
        'date': 'Monday, 8 February 2021',
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(24.0),
      itemCount: classes.length,
      itemBuilder: (context, index) {
        final item = classes[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 24.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 80,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blue[300],
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['title']!,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Tanggal Mulai ${item['date']}',
                      style: TextStyle(fontSize: 10, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildEditProfileTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTextField('Nama Pertama'),
          const SizedBox(height: 16),
          _buildTextField('Nama Terakhir'),
          const SizedBox(height: 16),
          _buildTextField('E-mail Address'),
          const SizedBox(height: 16),
          _buildTextField('Negara'),
          const SizedBox(height: 16),
          _buildTextField('Deskripsi', maxLines: 5),
          const SizedBox(height: 32),

          Align(
            alignment: Alignment.centerRight,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              child: const Text(
                'Simpan',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, {int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        const SizedBox(height: 8),
        TextField(
          maxLines: maxLines,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 12,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }
}
