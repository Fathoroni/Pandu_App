import 'package:flutter/material.dart';

class MateriPage extends StatelessWidget {
  const MateriPage({super.key});

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

                      // Description
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Deskripsi',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: textPrimary,
                                fontFamily: 'Inter',
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Antarmuka yang dibangun harus memperhatikan prinsip-prinsip desain yang ada. Hal ini diharapkan agar antarmuka yang dibangun bukan hanya menarik secara visual tetapi dengan memperhatikan kaidah-kaidah prinsip desain diharapkan akan mendukung pengguna dalam menggunakan produk secara baik.',
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: 14,
                                color: textSecondary,
                                height: 1.6,
                                fontFamily: 'Inter',
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Sticky Tabs (Simulated)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: surfaceColor,
                          border: Border(
                            bottom: BorderSide(
                              color: isDark
                                  ? Colors.grey[700]!
                                  : Colors.grey[100]!,
                            ),
                          ),
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: isDark ? Colors.grey[800] : Colors.grey[100],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    color: isDark
                                        ? Colors.grey[700]
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      if (!isDark)
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.05),
                                          blurRadius: 2,
                                          offset: const Offset(0, 1),
                                        ),
                                    ],
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Lampiran Materi',
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: primary,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {},
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 10,
                                    ),
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Tugas dan Kuis',
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: textSecondary,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // List Content
                      Expanded(
                        child: ListView(
                          padding: const EdgeInsets.all(16),
                          children: [
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
                          ],
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

          // Custom Bottom Navigation Bar
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.only(
                top: 12,
                bottom: 24,
                left: 24,
                right: 24,
              ),
              decoration: BoxDecoration(
                color: surfaceColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(
                    32,
                  ), // approx 2rem from HTML logic usually on bottom nav? HTML says rounded-t-3xl but placed at bottom? No, provided HTML has 'rounded-t-[2rem]' on nav
                  topRight: Radius.circular(32),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 15,
                    offset: const Offset(0, -5),
                  ),
                ],
                border: Border(
                  top: BorderSide(
                    color: isDark ? Colors.grey[800]! : Colors.grey[200]!,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildBottomNavItem(
                    Icons.home_rounded,
                    "Home",
                    false,
                    textSecondary,
                    primary,
                  ),
                  _buildCenterBottomNavItem(primary, isDark),
                  Stack(
                    children: [
                      _buildBottomNavItem(
                        Icons.notifications_rounded,
                        "Notifikasi",
                        false,
                        textSecondary,
                        primary,
                      ),
                      Positioned(
                        top: 0,
                        right: 12, // adjust for icon centering
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
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
    );
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

  Widget _buildBottomNavItem(
    IconData icon,
    String label,
    bool isActive,
    Color color,
    Color primary,
  ) {
    return SizedBox(
      width: 64,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: isActive ? primary : color, size: 24),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: isActive ? primary : color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCenterBottomNavItem(Color primary, bool isDark) {
    return SizedBox(
      width: 64,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            decoration: BoxDecoration(
              color: isDark
                  ? const Color(0xFF1E3A8A).withOpacity(0.2)
                  : const Color(0xFFEFF6FF),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(
              Icons.school,
              color: isDark ? Colors.blue[400] : primary,
              size: 24,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            "Kelas Saya",
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: isDark ? Colors.blue[400] : primary,
            ),
          ),
        ],
      ),
    );
  }
}
