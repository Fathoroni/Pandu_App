import 'package:flutter/material.dart';
import 'materi_page.dart';

class DetailKelasPage extends StatefulWidget {
  const DetailKelasPage({super.key});

  @override
  State<DetailKelasPage> createState() => _DetailKelasPageState();
}

class _DetailKelasPageState extends State<DetailKelasPage> {
  int _selectedTab = 0; // 0 = Materi, 1 = Tugas

  @override
  Widget build(BuildContext context) {
    // Colors from HTML/Tailwind config
    const primary = Color(0xFF2563EB); // #2563EB
    const secondary = Color(0xFF3B82F6);
    const backgroundLight = Color(0xFFF3F4F6);
    const backgroundDark = Color(0xFF111827);
    const surfaceLight = Color(0xFFFFFFFF);
    const surfaceDark = Color(0xFF1F2937);

    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bgColor = isDark ? backgroundDark : backgroundLight;
    final surfaceColor = isDark ? surfaceDark : surfaceLight;
    final textPrimary = isDark ? Colors.white : Colors.grey[900];
    final textSecondary = isDark ? Colors.grey[500] : Colors.grey[400];

    return Scaffold(
      backgroundColor: bgColor,
      body: Stack(
        children: [
          // Header (Blue Background)
          Container(
            padding: const EdgeInsets.only(
              top: 56,
              bottom: 48,
              left: 24,
              right: 24,
            ),
            decoration: const BoxDecoration(
              color: primary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40), // 2.5rem
                bottomRight: Radius.circular(40),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    if (Navigator.canPop(context)) Navigator.pop(context);
                  },
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.transparent,
                    ),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA D4SM-42-03 [ADY]',
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      height: 1.3,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Content Wrapper
          Padding(
            padding: const EdgeInsets.only(
              top: 140,
            ), // -mt-6 equivalent offset logic
            child: Column(
              children: [
                // Tabs
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: surfaceColor,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 4,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: _buildTabButton(
                          "Materi",
                          isSelected: _selectedTab == 0,
                          onTap: () => setState(() => _selectedTab = 0),
                          primary: primary,
                          isDark: isDark,
                        ),
                      ),
                      Expanded(
                        child: _buildTabButton(
                          "Tugas Dan Kuis",
                          isSelected: _selectedTab == 1,
                          onTap: () => setState(() => _selectedTab = 1),
                          primary: primary,
                          isDark: isDark,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // List Content
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.only(
                      left: 24,
                      right: 24,
                      bottom: 120,
                    ),
                    child: Column(
                      children: _selectedTab == 0
                          ? _buildMateriList(
                              isDark,
                              surfaceColor,
                              secondary,
                              textPrimary!,
                              textSecondary!,
                            )
                          : _buildTugasList(
                              isDark,
                              surfaceColor,
                              secondary,
                              textPrimary!,
                              textSecondary!,
                            ),
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

  Widget _buildTabButton(
    String text, {
    required bool isSelected,
    required VoidCallback onTap,
    required Color primary,
    required bool isDark,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected
              ? (isDark ? const Color(0xFF1F2937) : Colors.white)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(
              text,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                color: isSelected
                    ? primary
                    : (isDark ? Colors.grey[400] : Colors.grey[400]),
              ),
            ),
            if (isSelected)
              Container(
                margin: const EdgeInsets.only(top: 4),
                width: 32,
                height: 4,
                decoration: BoxDecoration(
                  color: primary,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(4),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildMateriList(
    bool isDark,
    Color surfaceColor,
    Color secondary,
    Color textPrimary,
    Color textSecondary,
  ) {
    final meetings = [
      {
        "tag": "Pertemuan 1",
        "title": "01 - Pengantar User Interface Design",
        "completed": false, // Gray check
        "details": ["3 URLs", "2 Files", "3 Interactive Content"],
      },
      {
        "tag": "Pertemuan 2",
        "title": "02 - Konsep User Interface Design",
        "completed": true, // Green check
        "details": ["2 URLs", "1 Kuis", "3 Files", "1 Tugas"],
      },
      {
        "tag": "Pertemuan 3",
        "title": "03 - Interaksi pada User Interface Design",
        "completed": true,
        "details": ["3 URLs", "2 Files", "3 Interactive Content"],
      },
      {
        "tag": "Pertemuan 4",
        "title": "04 - Ethnographic Observation",
        "completed": true,
        "details": ["3 URLs", "2 Files", "3 Interactive Content"],
      },
      {
        "tag": "Pertemuan 5",
        "title": "05 - UID Testing",
        "completed": true,
        "details": ["3 URLs", "2 Files", "3 Interactive Content"],
      },
      {
        "tag": "Pertemuan 6",
        "title": "06 - Assessment 1",
        "completed": true,
        "details": ["3 URLs", "2 Files", "3 Interactive Content"],
      },
    ];

    return meetings.map((m) {
      return Container(
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: surfaceColor,
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
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              if (m["title"].toString().contains(
                "Pengantar User Interface Design",
              )) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MateriPage()),
                );
              }
            },
            borderRadius: BorderRadius.circular(16),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: secondary,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Text(
                          (m["tag"] as String).toUpperCase(),
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.check_circle_rounded,
                        color: (m["completed"] as bool)
                            ? Colors.green[500]
                            : (isDark ? Colors.grey[600] : Colors.grey[300]),
                        size: 24,
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    m["title"] as String,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: textPrimary,
                      height: 1.25,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 8,
                    children: (m["details"] as List<String>)
                        .asMap()
                        .entries
                        .map((entry) {
                          final index = entry.key;
                          final text = entry.value;
                          final isLast =
                              index ==
                              (m["details"] as List<String>).length - 1;
                          return Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                text,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: textSecondary,
                                ),
                              ),
                              if (!isLast)
                                Container(
                                  margin: const EdgeInsets.only(left: 8),
                                  width: 4,
                                  height: 4,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    shape: BoxShape.circle,
                                  ),
                                ),
                            ],
                          );
                        })
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }).toList();
  }

  List<Widget> _buildTugasList(
    bool isDark,
    Color surfaceColor,
    Color secondary,
    Color textPrimary,
    Color textSecondary,
  ) {
    return [
      _buildTaskItem(
        type: "Quiz",
        title: "Quiz Review 01",
        deadline: "Tenggat Waktu : 26 Februari 2021 23:59 WIB",
        isCompleted: true, // check_circle зеленый
        isQuizIcon: true,
        isDark: isDark,
        surfaceColor: surfaceColor,
        textPrimary: textPrimary,
        textSecondary: textSecondary,
      ),
      _buildTaskItem(
        type: "Tugas",
        title: "Tugas 01 - UID Android Mobile Game",
        deadline: "Tenggat Waktu : 26 Februari 2021 23:59 WIB",
        isCompleted: false, // check_circle gray
        isQuizIcon: false,
        isDark: isDark,
        surfaceColor: surfaceColor,
        textPrimary: textPrimary,
        textSecondary: textSecondary,
      ),
      _buildTaskItem(
        type: "Pertemuan 3",
        title: "Kuis - Assessment 2",
        deadline: "Tenggat Waktu : 26 Februari 2021 23:59 WIB",
        isCompleted: true,
        isQuizIcon: true,
        isDark: isDark,
        surfaceColor: surfaceColor,
        textPrimary: textPrimary,
        textSecondary: textSecondary,
      ),
    ];
  }

  Widget _buildTaskItem({
    required String type,
    required String title,
    required String deadline,
    required bool isCompleted,
    required bool isQuizIcon,
    required bool isDark,
    required Color surfaceColor,
    required Color textPrimary,
    required Color textSecondary,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: surfaceColor,
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
      child: Column(
        children: [
          // Header: Tag + Check
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.blue[400],
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text(
                  type.toUpperCase(),
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
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
          const SizedBox(height: 24),
          // Content: Icon + Title
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon
              if (isQuizIcon)
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: isDark ? Colors.grey[200]! : Colors.grey[800]!,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      'QUIZ',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                        color: isDark ? Colors.grey[200] : Colors.grey[800],
                      ),
                    ),
                  ),
                )
              else
                SizedBox(
                  width: 48,
                  height: 48,
                  child: Stack(
                    children: [
                      Icon(
                        Icons.article_rounded,
                        size: 48,
                        color: isDark ? Colors.grey[200] : Colors.grey[800],
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: isDark ? Colors.grey[800] : Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.edit,
                            size: 14,
                            color: isDark ? Colors.grey[200] : Colors.grey[800],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                    color: textPrimary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Divider + Deadline
          Divider(
            color: isDark ? Colors.grey[700] : Colors.grey[100],
            height: 24, // pt-3 + border width logic roughly
          ),
          SizedBox(
            width: double.infinity,
            child: Text(
              deadline,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 12, // text-xs
                color: textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavItem(IconData icon, String label, bool isActive) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.blue[100], size: 32),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: Colors.blue[100],
          ),
        ),
      ],
    );
  }

  Widget _buildCenterBottomNavItem() {
    return Transform.translate(
      offset: const Offset(0, -24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
              border: Border.all(
                color: Colors.transparent,
                width: 4,
              ), // ring-4 ring-primary if needed, but HTML shows simple
            ),
            child: const Icon(Icons.school, color: Color(0xFF2563EB), size: 32),
          ),
          const SizedBox(height: 4),
          const Text(
            "Kelas Saya",
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
