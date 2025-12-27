import 'package:flutter/material.dart';
import 'detail_kelas_page.dart';

class KelasPage extends StatelessWidget {
  const KelasPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Data matched to "Kelas Saya" HTML reference
    final List<Map<String, dynamic>> courses = [
      {
        'title': 'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA',
        'subtitle': 'D4SM-42-03 [ADY]',
        'semester': '2025/2026',
        'progress': 0.89,
        'image':
            'https://lh3.googleusercontent.com/aida-public/AB6AXuBGouLzwWOuCmVlciWRyvsGSHyuV5YL7WRiUdN5WJNtNmksh4yy9n6Wbj5quG0mVcSCdqSJ26syYRjaE64sDNSf5y7S54kvn35sPa2AZ60lnngbAFE1R0Su5JAOjD6kT_JeiPc0EYwL4PNrvEIOAjzelvIjVTa4Fd4xHRYhRfdao9_uRU5PeH91Hihz9CqZ863IEmukA6PLmNHf6wBMDjx21oo7fmXx4TiANbSKMGBJcIZdVKw_5bZsamP_m0UnPU9-DtxRxEwyxNU',
        'type': 'UI/UX',
        'colorBg': Colors.yellow[100],
        'colorOverlay': Colors.yellow.withOpacity(
          0.2,
        ), // mix-blend-multiply sim
      },
      {
        'title': 'KEWARGANEGARAAN',
        'subtitle': 'D4SM-41-GAB1 [BBO]. JUMAT 2',
        'semester': '2025/2026',
        'progress': 0.86,
        'image':
            'https://lh3.googleusercontent.com/aida-public/AB6AXuAebRGdym-Gpgrf3togv27N3JTXH0GCqCjTAXdMeenspFdSiGz7c4MGUAmv5S7AoqekdRX_HZe01PgT-ge3vesQEbOynhxUsUByVjAMUBxwGhP2DmDDYEVmGQINxCntZADkq3r-abuZYSqvdTOkjH39gbd7SlZzHsMZyNCcWshP_bgD4j1e2tRmcuiDD7koOEs6izZTS4pzf3RhcO9oTyU20y3blEaUBoShcufgfV-YGqCJrm-tPkScwMBk6Wivm7CQeZ924EbtJfs',
        'type': null,
        'colorBg': Colors.red[100],
        'colorOverlay': Colors.red.withOpacity(0.1),
      },
      {
        'title': 'SISTEM OPERASI',
        'subtitle': 'D4SM-44-02 [DDS]',
        'semester': '2025/2026',
        'progress': 0.90,
        'image':
            'https://lh3.googleusercontent.com/aida-public/AB6AXuCop3acOCswPwcqY13O5HlJ-ao3soOUKcMaPSwSfTvUWRrUPwhwJrmK81dVU8LYOpmacBbm2_X1Y4lzcNqmZ101WoSxGrW9fzGslhzGmmxNOzfzNjx8ZjOfd_Fe897Us1M72LSzDtE1HFEfl-SQtdB_6DGZOR5lN404g0HsILhuF_Z4tvrLVpDu0BY5zuylJI18oTuD56XLVS9LLqQfC5sP_RMySrazcDYuxLldFW594XQzfByE8Pj_Kx_-pCydf9z3JkN5iEtpREk',
        'type': null,
        'colorBg': Colors.blue[100],
        'colorOverlay': Colors.transparent,
      },
      {
        'title': 'PEMROGRAMAN PERANGKAT BERGERAK MULTIMEDIA',
        'subtitle': 'D4SM-41-GAB1 [APJ]',
        'semester': '2025/2026',
        'progress': 0.90,
        'image':
            'https://lh3.googleusercontent.com/aida-public/AB6AXuAnne6DGIIlBYLeh1PtDh_WoCyo03WsIo-rx4HfTqbQ7eMwk4QpvYIVVMhxI9Vf-b2ErHvImfxSCQ0qsDKiKz1HvgXyiZQTXyQN1EYtyARrBWCJGdBpPjDObHtAN6nuNwgmNP3QQzFIT6Vssk2bVnUzkKVDPrUiflwXVKya1Ua9o_spwBSY6GIKFUcg4w7g295isrQvO4OBWjh3_laF2NEgzFTdSJvEp_dFiaz4XfkGwcsHkxCJWChJIrQBGtIRw6CwlJClBvjwVSs',
        'type': null,
        'colorBg': Colors.teal[100],
        'colorOverlay': Colors.transparent,
      },
      {
        'title': 'BAHASA INGGRIS: BUSINESS AND SCIENTIFIC',
        'subtitle': 'D4SM-41-GAB1 [ARS]',
        'semester': '2025/2026 ',
        'progress': 0.90,
        'image':
            'https://lh3.googleusercontent.com/aida-public/AB6AXuCGqkZjQU3m7OFZ01EltCmAwRC6RxJ5YplKYeSksPoy6nduoaeLeM43FXVd6nCStQjwRYwOsyZeMPKVSSyr0tBePsLn81BV6E3cHJc-mQHcYsmvl0KsSzKWHDvuRej6WFQu8t7YlkWrDGaJ9WzlzdPc_WA1q22aGN4DiJ16uPF4-_lZ5PosAZ0q_qSp-8ip_rTH0Ymc3hWiOUpCO0RfkPqi1uSveZ1lo7_i4BvBZB2TF9bDA6hsxao6e5mppev67ciquOES_BUhU5U',
        'type': null,
        'colorBg': Colors.grey[200],
        'colorOverlay': Colors.transparent,
      },
      {
        'title': 'PEMROGRAMAN MULTIMEDIA INTERAKTIF',
        'subtitle': 'D4SM-43-04 [TPR]',
        'semester': '2025/2026',
        'progress': 0.90,
        'image':
            'https://lh3.googleusercontent.com/aida-public/AB6AXuCqMWWpyC9HTpOWRuQHjiwl-QbmJ8DJoUbhlJfZ870IssnZaxsbzEsDBgzZCkoyu_9QfPphtEQCypFoECGuklXGPMOCwRMCauk2Q0QwE3sW2cx43CAkFqInQbAK6qBUdH2M-ihB4sSUKtHq5srAIEjlkS-Po8kpgbyDCjqltjXS_ohh0ardkjgr-ZvMpL78SYTchToZn_ACbPlxL4xJnBeKit2Fj6ASntslymOtSBf4_ard8yDbBw4vqFMFSkqC2oWkPvVZvRAfx5Y',
        'type': null,
        'colorBg': Colors.indigo[100],
        'colorOverlay': Colors.transparent,
      },
      {
        'title': 'OLAH RAGA',
        'subtitle': 'D3TT-44-02 [EYR]',
        'semester': '2025/2026',
        'progress': 0.90,
        'image':
            'https://lh3.googleusercontent.com/aida-public/AB6AXuC3I5RuUmYbv7WRfgaiG_-efEySy4M0Mr-0JHGHtfzOTYzZJmnDP8tSAgH5r2Mj53qB92e-sUbXMWhVVTuRQzuMHcXimXOEyy5qCMDq1WzQtNnkPEnABaU3jgw03DjwaG9hclwLCXyKarcKxnnKMcZ_saHAEScw1awETDcJAGIx1l4vb0AJaxdfB7pMfnZMSQ8q6wlC0b8sLo0h5I33hTrS0KQzahacn6GDvhBiaUKzpvcr_P6WX1J_x0mENJXwdcq7hD90AxGi0eg',
        'type': null,
        'colorBg': Colors.purple[100],
        'colorOverlay': Colors.transparent,
      },
    ];

    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDark
        ? const Color(0xFF0F172A)
        : const Color(0xFFF0F4F8);
    final surfaceColor = isDark ? const Color(0xFF1E293B) : Colors.white;
    final primary = const Color(0xFF2563EB); // Royal Blue

    return Scaffold(
      backgroundColor: backgroundColor,
      // Fixed Header matching HTML: "fixed top-0 z-50 bg-surface... backdrop-blur-md"
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(64),
        child: Container(
          decoration: BoxDecoration(
            color: surfaceColor.withOpacity(0.9),
            border: Border(
              bottom: BorderSide(
                color: isDark ? Colors.grey[700]! : Colors.grey[100]!,
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Text(
                    'Kelas Saya',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: isDark ? Colors.white : const Color(0xFF1E293B),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.only(
          top: 20,
          left: 16,
          right: 16,
          bottom: 120,
        ), // pb-28 ~ 112px
        itemCount: courses.length,
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          final course = courses[index];
          return Container(
            decoration: BoxDecoration(
              color: surfaceColor,
              borderRadius: BorderRadius.circular(16), // rounded-2xl
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 20,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DetailKelasPage(),
                    ),
                  );
                },
                borderRadius: BorderRadius.circular(16),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Image/Icon Box
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          color: course['colorBg'],
                          borderRadius: BorderRadius.circular(12), // rounded-xl
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            if (course['image'] != null)
                              Image.network(
                                course['image'],
                                fit: BoxFit.cover,
                                errorBuilder: (ctx, err, stack) => Icon(
                                  Icons.broken_image,
                                  color: Colors.grey[400],
                                ),
                              ),
                            if (course['colorOverlay'] == Colors.transparent)
                              Container()
                            else
                              Container(color: course['colorOverlay']),

                            // Tag (e.g. UI/UX)
                            if (course['type'] != null)
                              Positioned(
                                bottom: 4,
                                right: 4,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 4,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: isDark
                                        ? Colors.black.withOpacity(0.6)
                                        : Colors.white.withOpacity(0.9),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    course['type'],
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: isDark
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),

                      // Content
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              course['semester'],
                              style: const TextStyle(
                                color: Color(0xFF2563EB), // text-primary
                                fontSize: 12, // text-xs
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Inter',
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              course['title'],
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                height: 1.25,
                                color: isDark
                                    ? Colors.white
                                    : const Color(0xFF1E293B),
                                fontFamily: 'Poppins',
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              course['subtitle'],
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 10,
                                color: isDark
                                    ? const Color(0xFF94A3B8)
                                    : const Color(0xFF64748B), // text-sub
                                fontFamily: 'Inter',
                              ),
                            ),

                            const SizedBox(height: 12),

                            // Progress Bar
                            Container(
                              height: 6,
                              decoration: BoxDecoration(
                                color: isDark
                                    ? Colors.grey[700]
                                    : Colors.grey[100],
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: FractionallySizedBox(
                                widthFactor: course['progress'],
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: primary,
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 6),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Progress',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: isDark
                                        ? const Color(0xFF94A3B8)
                                        : const Color(0xFF64748B),
                                    fontFamily: 'Inter',
                                  ),
                                ),
                                Text(
                                  '${(course['progress'] * 100).toInt()}% Selesai',
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    color: isDark ? Colors.blue[400] : primary,
                                    fontFamily: 'Inter',
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
