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

  static final List<Widget> _widgetOptions = <Widget>[
    const _HomeDashboard(),
    const KelasPage(),
    const NotifikasiPage(),
    const ProfilePage(), // Placeholder if needed, though nav only has 3 items
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDark
        ? const Color(0xFF111827)
        : const Color(0xFFF3F4F6);
    final cardColor = isDark ? const Color(0xFF1F2937) : Colors.white;

    return Scaffold(
      backgroundColor: backgroundColor,
      // We use Stack to position the custom floating nav bar if we want true "fixed bottom"
      // But Scaffold bottomNavigationBar is easier. styling accordingly.
      extendBody:
          true, // This allows body to go behind the bottom bar if transparent
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: _buildNavIcon(Icons.home_rounded, 0),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: _buildNavIcon(Icons.school, 1),
                label: 'Kelas Saya',
              ),
              BottomNavigationBarItem(
                // Custom notification icon with badge
                icon: Stack(
                  children: [
                    _buildNavIcon(Icons.notifications_rounded, 2),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                          border: Border.all(color: cardColor, width: 1.5),
                        ),
                      ),
                    ),
                  ],
                ),
                label: 'Notifikasi',
              ),
            ],
            currentIndex: _selectedIndex < 3 ? _selectedIndex : 0,
            backgroundColor: cardColor,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: const Color(0xFF2563EB), // Primary Blue
            unselectedItemColor: isDark ? Colors.grey[500] : Colors.grey[400],
            selectedLabelStyle: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelStyle: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
            onTap: (index) {
              if (index < 3) _onItemTapped(index);
            },
          ),
        ),
      ),
    );
  }

  Widget _buildNavIcon(IconData icon, int index) {
    final isSelected = _selectedIndex == index;
    final primary = const Color(0xFF2563EB);
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: isSelected ? primary.withOpacity(0.1) : Colors.transparent,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, size: 24),
    );
  }
}

class _HomeDashboard extends StatelessWidget {
  const _HomeDashboard();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Theme Colors
    final primary = const Color(0xFF2563EB);
    // final primaryLight = const Color(0xFF60A5FA);
    final textHeader = isDark
        ? const Color(0xFFF9FAFB)
        : const Color(0xFF1F2937); // text-light/dark
    final cardColor = isDark ? const Color(0xFF1F2937) : Colors.white;

    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 100), // Space for bottom nav
      child: Column(
        children: [
          // Header Section
          Container(
            padding: const EdgeInsets.fromLTRB(
              24,
              64,
              24,
              48,
            ), // pt-12 (48) + statusbar, pb-8 (32) -> increased for visual match
            decoration: BoxDecoration(
              color: primary,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  color: primary.withOpacity(0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hallo,',
                      style: TextStyle(
                        color: Colors.blue[100],
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'DANDY CANDRA PRATAMA',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20, // text-xl
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfilePage(),
                      ),
                    );
                  },
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 4,
                      top: 4,
                      bottom: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(50), // rounded-full
                      border: Border.all(color: Colors.white.withOpacity(0.3)),
                    ),
                    child: Row(
                      children: [
                        const Text(
                          'MAHASISWA',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize:
                                11, // text-xs gives ~12, but tracking wide
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                          child: Icon(Icons.person, color: primary, size: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Main Content with negative margin overlap
          Transform.translate(
            offset: const Offset(0, -24), // -mt-6 (~24px)
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  // Section: Tugas Yang Akan Datang
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 4, bottom: 12),
                        child: Text(
                          'Tugas Yang Akan Datang',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: textHeader,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              primary,
                              const Color(
                                0xFF2563EB,
                              ), // Blue 600 equivalent-ish
                            ],
                          ),
                          borderRadius: BorderRadius.circular(
                            16,
                          ), // rounded-2xl
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue.withOpacity(0.2),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          height: 1.2,
                                          fontFamily: 'Poppins',
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        'Tugas 01 - UID Android Mobile Game',
                                        style: TextStyle(
                                          color: Colors.blue[100],
                                          fontSize: 14,
                                          fontFamily: 'Poppins',
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Icon(
                                    Icons.assignment,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 24),
                            Container(
                              height: 1,
                              color: Colors.white.withOpacity(0.2),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Waktu Pengumpulan'.toUpperCase(),
                              style: TextStyle(
                                color: Colors.blue[100],
                                fontSize: 12, // text-xs
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: const [
                                Icon(
                                  Icons.schedule,
                                  color: Colors.white,
                                  size: 16,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'Jumat 26 Februari, 23:59 WIB',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 32),

                  // Section: Pengumuman Terakhir
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Pengumuman Terakhir',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: textHeader,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            Text(
                              'Lihat Semua',
                              style: TextStyle(
                                color: primary,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Poppins',
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        decoration: BoxDecoration(
                          color: cardColor,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 2,
                            ),
                          ],
                          border: Border.all(
                            color: isDark
                                ? Colors.grey[700]!
                                : Colors.grey[100]!,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                              child: Text(
                                'Maintenance Pra UAS Semester Genap 2020/2021',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: textHeader.withOpacity(0.9),
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 160,
                              width: double.infinity,
                              child: Stack(
                                children: [
                                  // Image
                                  Positioned.fill(
                                    child: Image.network(
                                      'https://lh3.googleusercontent.com/aida-public/AB6AXuC4ksO12PaoFaZmxqoKP28ycmuH13-0LjGRmit1UdaqyKJkjdXgqMiZTCP1vQ64tiSiIen8FekjasbY6arUjrnemvJ01Mf9XHVA47xhztLn8yQq3jloG3i5ABMj5pbWOSuWxoUUApGxwabLOpCjDsq6SMu1wV09F3hMea4D25mVn5MvnuP9OqqNfHzLuT4M1awmeDsYiyDuqkXAFIWw1QiKXyGdx82nnUW8NBA95E9dAdWdbF0nFENzrbfKEVLX9nCP8OBAamnHvs0',
                                      fit: BoxFit.cover,
                                      errorBuilder: (ctx, err, stack) =>
                                          Container(color: Colors.grey[300]),
                                    ),
                                  ),
                                  // Gradient
                                  Positioned.fill(
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                          colors: [
                                            Colors.black54,
                                            Colors.transparent,
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Badge
                                  Positioned(
                                    bottom: 12,
                                    left: 16,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: primary.withOpacity(0.9),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: const Text(
                                        'System Update',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 32),

                  // Section: Progres Kelas
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 4, bottom: 16),
                        child: Text(
                          'Progres Kelas',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: textHeader,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),

                      // List Items
                      _buildClassProgressItem(
                        context,
                        title:
                            'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA D4SM-42-03 [ADY]',
                        semester: '2021/2',
                        progress: 0.89,
                        iconContent: Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Colors.orange, Colors.amber],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Center(
                            child: Text(
                              'UI/UX',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        bgColor: Colors.amber[100]!,
                      ),

                      _buildClassProgressItem(
                        context,
                        title: 'KEWARGANEGARAAN D4SM-41-GAB1 [BBO]. JUMAT 2',
                        semester: '2021/2',
                        progress: 0.86,
                        iconContent: Image.network(
                          'https://lh3.googleusercontent.com/aida-public/AB6AXuDDISYgpcUGXY-Pe6Zc_VUAdLg0YZCeBJfIaWu6VKw29cELRWlnlTIDcXUlkPrtthp1q5TwZYwMnB2NJ4EC6_WNTmKYAO9_2qsTSiCcfxKFsEQD-KmlSfwDktdbw4ZQlRJ65V83GD42BF-LY8frmy7ApRu8EI56Iyfo3Zs0aUe2-80FuXx3NJg9RhInvYQumLn1zQBIsbBHGb9laSaLktTvDCel9Dli-gpBBAoVA2D_wgZbcdQR5O5Mys03NhH9QG35MO1uF0IbcGA',
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(
                                Icons.broken_image,
                                color: Colors.grey,
                              ),
                        ),
                        bgColor: Colors.red[100]!,
                      ),

                      _buildClassProgressItem(
                        context,
                        title: 'SISTEM OPERASI D4SM-44-02 [DDS]',
                        semester: '2021/2',
                        progress: 0.90,
                        iconContent: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.network(
                              'https://lh3.googleusercontent.com/aida-public/AB6AXuD6QOu5Sj4w3P9wI1TmIat3-nQZDoso5pd8okqiAu7DnvFhreAPWMgPSSlICyngJIWf2jLX5Vf9dpxFiD00oxyAp4lfLXdviTwgr0i-_O4Y6Nx41P7ruRxDOzarxYEX56qayAgClC9xqMztnlC8qOLr-JDFFLkJOwLQjfxTdoyVkxu_sI5KKwW6rnQxDLjaeHBnTw-6ayx0j16mTSCy3OwbHiEcnjAM7Whcc1SDr3k6D3i44rBfWd20l4RYm99bMZETGLhMdYgxXmI',
                              fit: BoxFit.cover,
                              opacity: const AlwaysStoppedAnimation(0.8),
                              errorBuilder: (context, error, stackTrace) =>
                                  Container(color: Colors.blue[100]),
                            ),
                            Center(
                              child: Text(
                                "SYS",
                                style: TextStyle(
                                  color: Colors.blue[900],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                        bgColor: Colors.blue[100]!,
                      ),

                      _buildClassProgressItem(
                        context,
                        title: 'PEMROGRAMAN PERANGKAT BERGERAK MULTIMEDIA',
                        semester: '2021/2',
                        progress: 0.90,
                        iconContent: Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Colors.tealAccent, Colors.cyan],
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        bgColor: Colors.teal[100]!,
                      ),

                      _buildClassProgressItem(
                        context,
                        title: 'BAHASA INGGRIS: BUSINESS AND SCIENTIFIC',
                        semester: '2021/2',
                        progress: 0.90,
                        iconContent: Stack(
                          fit: StackFit.expand,
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Colors.indigo, Colors.purple],
                                ),
                              ),
                            ),
                            const Center(
                              child: Text(
                                "ENG",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        bgColor: Colors.indigo[100]!,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildClassProgressItem(
    BuildContext context, {
    required String title,
    required String semester,
    required double progress,
    required Widget iconContent,
    required Color bgColor,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardColor = isDark ? const Color(0xFF1F2937) : Colors.white;
    final textColor = isDark ? Colors.white : const Color(0xFF1F2937);
    final mutedColor = isDark
        ? const Color(0xFF9CA3AF)
        : const Color(0xFF6B7280);

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isDark ? Colors.grey[700]! : Colors.grey[100]!,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: iconContent,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  semester,
                  style: TextStyle(
                    fontSize: 12,
                    color: mutedColor,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: textColor,
                    height: 1.2,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 8),
                Stack(
                  children: [
                    Container(
                      height: 8,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: isDark ? Colors.grey[700] : Colors.grey[200],
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    FractionallySizedBox(
                      widthFactor: progress,
                      child: Container(
                        height: 8,
                        decoration: BoxDecoration(
                          color: const Color(0xFF2563EB), // Primary
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    '${(progress * 100).toInt()}% Selesai',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: mutedColor,
                    ),
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
