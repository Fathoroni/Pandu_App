import 'package:flutter/material.dart';
import 'detail_kelas_page.dart';

class KelasPage extends StatelessWidget {
  const KelasPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Data matched to "Kelas Saya" reference image
    final List<Map<String, dynamic>> courses = [
      {
        'title': 'DESAIN ANTARMUKA & PENGALAMAN PENGGUNA D4SM-42-03 [ADY]',
        'semester': '2021/2',
        'progress': 0.89,
        'color': Colors.amber,
        'label': 'UI/UX',
        'labelColor': Colors.white,
      },
      {
        'title': 'KEWARGANEGARAAN\nD4SM-41-GAB1 [BBO], JUMAT 2',
        'semester': '2021/2',
        'progress': 0.86,
        'color': const Color(0xFFD32F2F), // Red
        'label': 'PKN', // Icon in image looks like Garuda, using text for now
        'labelColor': Colors.white,
      },
      {
        'title': 'SISTEM OPERASI\nD4SM-44-02 [DDS]',
        'semester': '2021/2',
        'progress': 0.90,
        'color': Colors.purple, // Word cloud placeholder
        'label': 'OS',
        'labelColor': Colors.white,
      },
      {
        'title':
            'PEMROGRAMAN PERANGKAT BERGERAK MULTIMEDIA\nD4SM-41-GAB1 [APJ]',
        'semester': '2021/2',
        'progress': 0.90,
        'color': Colors.cyanAccent.shade100,
        'label': 'Mobile',
        'labelColor': Colors.black54,
      },
      {
        'title': 'BAHASA INGGRIS: BUSINESS AND SCIENTIFIC\nD4SM-41-GAB1 [ARS]',
        'semester': '2021/2',
        'progress': 0.80,
        'color': Colors.grey.shade300,
        'label': 'Ing',
        'labelColor': Colors.black54,
      },
      {
        'title': 'PEMROGRAMAN MULTIMEDIA INTERAKTIF\nD4SM-43-04 [TPR]',
        'semester': '2021/2',
        'progress': 0.90,
        'color': Colors.blue.shade900,
        'label': 'MM',
        'labelColor': Colors.white,
      },
      {
        'title': 'OLAH RAGA\nD3TT-44-02 [EYR]',
        'semester': '2021/2',
        'progress': 0.90,
        'color': Colors.purpleAccent.shade100,
        'label': 'OR',
        'labelColor': Colors.white,
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Kelas Saya',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Ideally pop if pushed, otherwise handle tab switching
            // Since this page is part of BottomNav, pop might exit app
            // But requirement asked for the button.
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(24.0),
        itemCount: courses.length,
        separatorBuilder: (context, index) => const SizedBox(height: 24),
        itemBuilder: (context, index) {
          final course = courses[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DetailKelasPage(),
                ),
              );
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Thumbnail
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: course['color'],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      course['label'],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: course['labelColor'],
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
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
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        course['title'],
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          height: 1.2,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 12),

                      // Progress Bar
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: LinearProgressIndicator(
                          value: course['progress'],
                          minHeight: 10,
                          backgroundColor: Colors.grey[300],
                          color: const Color(0xFFB71C1C), // Deep Red
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        '${(course['progress'] * 100).toInt()}% Selesai',
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black87,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
