import 'package:flutter/material.dart';
import 'detail_pengumuman_page.dart';

class NotifikasiPage extends StatelessWidget {
  const NotifikasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDark
        ? const Color(0xFF0F172A)
        : const Color(0xFFF3F4F6);
    final surfaceColor = isDark ? const Color(0xFF1E293B) : Colors.white;
    final primary = const Color(
      0xFF2563EB,
    ); // Vibrant Royal Blue - Notification Tab
    final primaryAnnouncement = const Color(
      0xFF2563EB,
    ); // Announcement Tab Primary

    final textMain = isDark ? const Color(0xFFF8FAFC) : const Color(0xFF1F2937);
    // announcement text colors
    final textGray900 = isDark ? Colors.white : Colors.grey[900];
    final textGray500 = isDark ? Colors.grey[400] : Colors.grey[500];

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(
            110,
          ), // Increased height for TabBar
          child: Container(
            decoration: BoxDecoration(
              color: surfaceColor.withOpacity(0.9),
              border: Border(
                bottom: BorderSide(
                  color: isDark ? Colors.grey[700]! : Colors.grey[200]!,
                ),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 4,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: SafeArea(
              child: Column(
                children: [
                  // Top Bar
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              onTap: () {
                                if (Navigator.canPop(context))
                                  Navigator.pop(context);
                              },
                              borderRadius: BorderRadius.circular(50),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.arrow_back, color: textMain),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          'Pusat Informasi', // Changed title to be inclusive
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: textMain,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Tab Bar
                  TabBar(
                    labelColor: primary,
                    unselectedLabelColor: textGray500,
                    indicatorColor: primary,
                    labelStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Inter',
                    ),
                    unselectedLabelStyle: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Inter',
                    ),
                    tabs: const [
                      Tab(text: "Notifikasi"),
                      Tab(text: "Pengumuman"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            // Tab 1: Notifikasi (Previous Implementation)
            _NotifikasiTab(
              backgroundColor: backgroundColor,
              surfaceColor: surfaceColor,
              textMain: textMain,
              primary: primary,
              isDark: isDark,
            ),

            // Tab 2: Pengumuman (New Implementation)
            _PengumumanTab(
              isDark: isDark,
              surfaceColor: surfaceColor,
              primary: primaryAnnouncement,
              textGray900: textGray900!,
              textGray500: textGray500!,
            ),
          ],
        ),
      ),
    );
  }
}

class _NotifikasiTab extends StatelessWidget {
  final Color backgroundColor;
  final Color surfaceColor;
  final Color textMain;
  final Color primary;
  final bool isDark;

  const _NotifikasiTab({
    required this.backgroundColor,
    required this.surfaceColor,
    required this.textMain,
    required this.primary,
    required this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    final textSub = isDark ? const Color(0xFF94A3B8) : const Color(0xFF6B7280);

    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 20, left: 16, right: 16, bottom: 120),
      child: Column(
        children: [
          // Filter / Actions
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'TERBARU',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2, // wide tracking
                    color: textSub,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    'Tandai semua dibaca',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: primary,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Notifications List
          Column(
            children: [
              _buildNotificationItem(
                iconData: Icons.assignment_turned_in_rounded,
                messageParts: [
                  const TextSpan(
                    text: 'Anda telah mengirimkan pengajuan tugas untuk ',
                  ),
                  TextSpan(
                    text:
                        'Pengumpulan Laporan Akhir Assessment 3 (Tugas Besar)',
                    style: TextStyle(
                      color: primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
                time: '3 Hari 9 Jam Yang Lalu',
                isUnread: true,
                backgroundColor: surfaceColor,
                textMain: textMain,
                textSub: textSub,
                primary: primary,
                isDark: isDark,
              ),
              _buildNotificationItem(
                iconData: Icons.quiz_outlined,
                messageParts: [
                  const TextSpan(
                    text: 'Anda telah mengirimkan pengajuan tugas untuk ',
                  ),
                  TextSpan(
                    text:
                        'Pengumpulan Laporan Akhir Assessment 3 (Tugas Besar)',
                    style: TextStyle(
                      color: primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
                time: '3 Hari 9 Jam Yang Lalu',
                isUnread: false,
                backgroundColor: surfaceColor,
                textMain: textMain,
                textSub: textSub,
                primary: primary,
                isDark: isDark,
              ),
              _buildNotificationItem(
                iconData: Icons.assignment_rounded,
                messageParts: [
                  const TextSpan(
                    text: 'Anda telah mengirimkan pengajuan tugas untuk ',
                  ),
                  TextSpan(
                    text:
                        'Pengumpulan Laporan Akhir Assessment 3 (Tugas Besar)',
                    style: TextStyle(
                      color: primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
                time: '3 Hari 9 Jam Yang Lalu',
                isUnread: false,
                backgroundColor: surfaceColor,
                textMain: textMain,
                textSub: textSub,
                primary: primary,
                isDark: isDark,
              ),
            ],
          ),

          const SizedBox(height: 24),
          // Dot Pagination Indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildDot(isDark),
              const SizedBox(width: 8),
              _buildDot(isDark),
              const SizedBox(width: 8),
              _buildDot(isDark),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDot(bool isDark) {
    return Container(
      width: 4,
      height: 4,
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[600] : Colors.grey[300],
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildNotificationItem({
    required IconData iconData,
    required List<InlineSpan> messageParts,
    required String time,
    required bool isUnread,
    required Color backgroundColor,
    required Color textMain,
    required Color textSub,
    required Color primary,
    required bool isDark,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16), // rounded-2xl
        border: Border.all(
          color: isDark ? Colors.grey[700]! : Colors.grey[100]!,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon Box
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: isDark
                      ? const Color(0xFF1E3A8A).withOpacity(0.2)
                      : const Color(0xFFEFF6FF), // blue-50
                  borderRadius: BorderRadius.circular(12), // rounded-xl
                ),
                child: Icon(iconData, color: primary, size: 24),
              ),
              const SizedBox(width: 16),
              // Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          height: 1.4, // leading-snug
                          color: textMain,
                          fontWeight: FontWeight.w500,
                        ),
                        children: messageParts,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.schedule, size: 10, color: textSub),
                        const SizedBox(width: 4),
                        Text(
                          time,
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 12, // text-xs
                            color: textSub,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Unread Indicator
          if (isUnread)
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: primary,
                  shape: BoxShape.circle,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _PengumumanTab extends StatelessWidget {
  final bool isDark;
  final Color surfaceColor;
  final Color primary;
  final Color textGray900;
  final Color textGray500;

  const _PengumumanTab({
    required this.isDark,
    required this.surfaceColor,
    required this.primary,
    required this.textGray900,
    required this.textGray500,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 20, left: 16, right: 16, bottom: 120),
      children: [
        _buildAnnouncementItem(
          context,
          title: 'Maintenance Pra UAS Semester Genap 2020/2021',
          admin: 'Admin Celoe',
          date: 'Rabu, 2 Juni 2021, 10:45',
        ),
        _buildAnnouncementItem(
          context,
          title: 'Pengumuman Maintance',
          admin: 'Admin Celoe',
          date: 'Senin, 11 Januari 2021, 7:52',
        ),
        _buildAnnouncementItem(
          context,
          title: 'Maintenance Pra UAS Semeter Ganjil 2020/2021',
          admin: 'Admin Celoe',
          date: 'Minggu, 10 Januari 2021, 9:30',
        ),

        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Center(
            child: Text(
              'Tidak ada pengumuman lainnya',
              style: TextStyle(color: Colors.grey[400], fontSize: 12),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAnnouncementItem(
    BuildContext context, {
    required String title,
    required String admin,
    required String date,
  }) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const DetailPengumumanPage()),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: surfaceColor,
          borderRadius: BorderRadius.circular(16), // rounded-xl
          border: Border.all(
            color: isDark ? Colors.grey[700]! : Colors.grey[100]!,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 20,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon Circle
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: isDark
                    ? const Color(0xFF1E3A8A).withOpacity(0.2)
                    : const Color(0xFFEFF6FF), // blue-50
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.campaign_rounded, color: primary, size: 24),
            ),
            const SizedBox(width: 16),

            // Text Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      height: 1.25, // leading-snug
                      color: textGray900,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.person, size: 14, color: textGray500),
                          const SizedBox(width: 4),
                          Text(
                            admin,
                            style: TextStyle(fontSize: 12, color: textGray500),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.event, size: 14, color: textGray500),
                          const SizedBox(width: 4),
                          Text(
                            date,
                            style: TextStyle(fontSize: 12, color: textGray500),
                          ),
                        ],
                      ),
                    ],
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
