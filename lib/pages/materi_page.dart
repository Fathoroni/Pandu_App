import 'package:flutter/material.dart';
import 'quiz/quiz_start_page.dart';

class MateriPage extends StatefulWidget {
  const MateriPage({super.key});

  @override
  State<MateriPage> createState() => _MateriPageState();
}

class _MateriPageState extends State<MateriPage> {
  int _selectedTab = 0; // 0 = Lampiran Materi, 1 = Tugas dan Kuis

  @override
  Widget build(BuildContext context) {
    // Colors from HTML
    const primary = Color(0xFF2563EB);
    const backgroundLight = Color(0xFFF3F4F6);
    const backgroundDark = Color(0xFF111827);
    const surfaceLight = Color(0xFFFFFFFF);
    const surfaceDark = Color(0xFF1F2937);
    const textPrimaryLight = Color(0xFF111827);
    const textPrimaryDark = Color(0xFFF9FAFB);
    const textSecondaryLight = Color(0xFF4B5563);
    const textSecondaryDark = Color(0xFF9CA3AF);

    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDark ? backgroundDark : backgroundLight;
    final surfaceColor = isDark ? surfaceDark : surfaceLight;
    final textPrimary = isDark ? textPrimaryDark : textPrimaryLight;
    final textSecondary = isDark ? textSecondaryDark : textSecondaryLight;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          Column(
            children: [
              // Top Bar (Status Bar Sim + Header)
              Container(
                height: 50, // Approx h-12
                color: surfaceColor,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SafeArea(
                  bottom: false,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '9:41',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: isDark ? Colors.white : Colors.black,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.signal_cellular_alt,
                            size: 14,
                            color: isDark ? Colors.white : Colors.black,
                          ),
                          SizedBox(width: 4),
                          Icon(
                            Icons.wifi,
                            size: 14,
                            color: isDark ? Colors.white : Colors.black,
                          ),
                          SizedBox(width: 4),
                          Icon(
                            Icons.battery_full,
                            size: 14,
                            color: isDark ? Colors.white : Colors.black,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 8),

              // Main Content Card
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: surfaceColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 6,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // Handle
                      Center(
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 16),
                          width: 64,
                          height: 6,
                          decoration: BoxDecoration(
                            color: isDark ? Colors.grey[600] : Colors.grey[300],
                            borderRadius: BorderRadius.circular(3),
                          ),
                        ),
                      ),

                      // Title
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 0,
                        ),
                        child: Text(
                          'Pengantar User Interface Design',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: textPrimary,
                            height: 1.25,
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Tabs
                      Container(
                        decoration: BoxDecoration(
                          color: isDark
                              ? const Color(0xFF1F2937)
                              : const Color(0xFFF9FAFB), // gray-50/50
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () => setState(() => _selectedTab = 0),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                  ),
                                  decoration: BoxDecoration(
                                    border: _selectedTab == 0
                                        ? const Border(
                                            bottom: BorderSide(
                                              color: primary,
                                              width: 2,
                                            ),
                                          )
                                        : null,
                                  ),
                                  child: Text(
                                    'Lampiran Materi',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: _selectedTab == 0
                                          ? primary
                                          : (isDark
                                                ? Colors.grey[400]
                                                : Colors.grey[500]),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                onTap: () => setState(() => _selectedTab = 1),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                  ),
                                  decoration: BoxDecoration(
                                    border: _selectedTab == 1
                                        ? const Border(
                                            bottom: BorderSide(
                                              color: primary,
                                              width: 2,
                                            ),
                                          )
                                        : null,
                                  ),
                                  child: Text(
                                    'Tugas dan Kuis',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: _selectedTab == 1
                                          ? primary
                                          : (isDark
                                                ? Colors.grey[400]
                                                : Colors.grey[500]),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // List Content
                      Expanded(
                        child: ListView(
                          padding: const EdgeInsets.all(16),
                          children: _selectedTab == 0
                              ? _buildLampiranList(
                                  isDark,
                                  surfaceColor,
                                  textPrimary,
                                  primary,
                                )
                              : _buildTugasList(
                                  isDark,
                                  surfaceColor,
                                  textPrimary,
                                  textSecondary,
                                  primary,
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Back Button Overlay (to allow navigation back)
          Positioned(
            top: 50,
            left: 10,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: isDark ? Colors.white : Colors.black,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildLampiranList(
    bool isDark,
    Color surfaceColor,
    Color textPrimary,
    Color primary,
  ) {
    return [
      _buildAttachmentItem(
        icon: Icons.link,
        title: 'Zoom Meeting Synchronous',
        isCompleted: true,
        isDark: isDark,
        surfaceColor: surfaceColor,
        textPrimary: textPrimary,
        primary: primary,
      ),
      _buildAttachmentItem(
        icon: Icons.description_outlined,
        title: 'Pengantar User Interface Design',
        isCompleted: false, // HTML has gray check
        isDark: isDark,
        surfaceColor: surfaceColor,
        textPrimary: textPrimary,
        primary: primary,
      ),
      _buildAttachmentItem(
        icon: Icons.article_outlined,
        title: 'Empat Teori Dasar Antarmuka',
        isCompleted: false,
        isDark: isDark,
        surfaceColor: surfaceColor,
        textPrimary: textPrimary,
        primary: primary,
      ),
      _buildAttachmentItem(
        icon: Icons.article_outlined,
        title: 'Prinsip Desain UID',
        isCompleted: true,
        isDark: isDark,
        surfaceColor: surfaceColor,
        textPrimary: textPrimary,
        primary: primary,
      ),
      _buildAttachmentItem(
        icon: Icons.image_outlined,
        title: 'User Interface Design for Beginner',
        isCompleted: true,
        isDark: isDark,
        surfaceColor: surfaceColor,
        textPrimary: textPrimary,
        primary: primary,
      ),
      _buildAttachmentItem(
        icon: Icons.link,
        title: '20 Prinsip Desain',
        isCompleted: true,
        isDark: isDark,
        surfaceColor: surfaceColor,
        textPrimary: textPrimary,
        primary: primary,
      ),
      _buildAttachmentItem(
        icon: Icons.link,
        title: 'Best Practice UI Design',
        isCompleted: true,
        isDark: isDark,
        surfaceColor: surfaceColor,
        textPrimary: textPrimary,
        primary: primary,
      ),
      const SizedBox(height: 100), // Space for bottom nav
    ];
  }

  List<Widget> _buildTugasList(
    bool isDark,
    Color surfaceColor,
    Color textPrimary,
    Color textSecondary,
    Color primary,
  ) {
    final cardColor = isDark ? const Color(0xFF1F2937) : Colors.white;
    final borderColor = isDark ? Colors.grey[700]! : Colors.grey[100]!;

    return [
      InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const QuizStartPage()),
          );
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: borderColor),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 2,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start, // Align to top
            children: [
              // Icon Sidebar
              Container(
                width: 56,
                height: 120, // Min height to match content
                decoration: BoxDecoration(
                  border: Border(right: BorderSide(color: borderColor)),
                ),
                child: Center(
                  child: Icon(
                    Icons.quiz_rounded,
                    color: isDark ? Colors.grey[200] : Colors.grey[800],
                    size: 24,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Quiz Review 01',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: textPrimary,
                            ),
                          ),
                          Icon(
                            Icons.check_circle_rounded,
                            color: Colors.green,
                            size: 20,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Silahkan kerjakan kuis ini dalam waktu 15 menit sebagai nilai pertama komponen kuis. Jangan lupa klik tombol Submit Answer setelah menjawab seluruh pertanyaan.',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 11,
                          color: textSecondary,
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Kerjakan sebelum hari Jum'at, 26 Februari 2021 jam 23:59 WIB.",
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 10,
                          fontStyle: FontStyle.italic,
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      // Tugas 01
      Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: borderColor),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon Sidebar
            Container(
              width: 56,
              // height: double.infinity, // Intrinsic height
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: borderColor)),
              ),
              child: Center(
                child: Icon(
                  Icons.assignment_rounded,
                  color: isDark ? Colors.grey[200] : Colors.grey[800],
                  size: 24,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            'Tugas 01 - UID Android Mobile Game',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: textPrimary,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Icon(
                          Icons.check_circle_rounded,
                          color: isDark ? Colors.grey[600] : Colors.grey[300],
                          size: 20,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '1. Buatlah desain tampilan (antarmuka) pada aplikasi mobile game FPS (First Person Shooter) yang akan menjadi tugas pada mata kuliah Pemrograman Aplikasi Permainan.',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 11,
                        color: textSecondary,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '2. Desain yang dibuat harus melingkupi seluruh tampilan pada aplikasi/game, dari pertama kali aplikasi dijalankan.',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 11,
                        color: textSecondary,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // Materi Bacaan 02 (Opacity 0.6)
      Opacity(
        opacity: 0.6,
        child: Container(
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            color: cardColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: borderColor),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 2,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Icon Sidebar
              Container(
                width: 56,
                height: 80,
                decoration: BoxDecoration(
                  border: Border(right: BorderSide(color: borderColor)),
                ),
                child: Center(
                  child: Icon(
                    Icons.description_rounded,
                    color: isDark ? Colors.grey[200] : Colors.grey[800],
                    size: 24,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Materi Bacaan 02',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: textPrimary,
                            ),
                          ),
                          Icon(
                            Icons.check_circle_rounded,
                            color: isDark
                                ? Colors.grey[600]
                                : Colors.grey[300], // gray-300
                            size: 20,
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Materi tambahan mengenai prinsip desain visual.',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 11,
                          color: textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),

      const SizedBox(height: 100),
    ];
  }

  Widget _buildAttachmentItem({
    required IconData icon,
    required String title,
    required bool isCompleted,
    required bool isDark,
    required Color surfaceColor,
    required Color textPrimary,
    required Color primary,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[800] : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isDark ? Colors.grey[700]! : Colors.grey[100]!,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: isDark
                        ? const Color(0xFF1E3A8A).withOpacity(0.3)
                        : const Color(0xFFEFF6FF),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: primary, size: 20),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: textPrimary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.check_circle_rounded,
            color: isCompleted
                ? Colors.green[500]
                : (isDark ? Colors.grey[600] : Colors.grey[300]),
            size: 24,
          ),
        ],
      ),
    );
  }
}
