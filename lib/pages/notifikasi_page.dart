import 'package:flutter/material.dart';

class NotifikasiPage extends StatelessWidget {
  const NotifikasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock data matching the reference image "Notifikasi"
    final List<Map<String, dynamic>> notifications = [
      {
        'message':
            'Anda telah mengirimkan pengajuan tugas untuk Pengumpulan Laporan Akhir Assessment 3 (Tugas Besar)',
        'time': '3 Hari 9 Jam Yang Lalu',
        'type': 'submission',
      },
      {
        'message':
            'Anda telah mengirimkan pengajuan tugas untuk Pengumpulan Laporan Akhir Assessment 3 (Tugas Besar)',
        'time': '3 Hari 9 Jam Yang Lalu',
        'type': 'quiz',
      },
      {
        'message':
            'Anda telah mengirimkan pengajuan tugas untuk Pengumpulan Laporan Akhir Assessment 3 (Tugas Besar)',
        'time': '3 Hari 9 Jam Yang Lalu',
        'type': 'submission',
      },
      {
        'message':
            'Anda telah mengirimkan pengajuan tugas untuk Pengumpulan Laporan Akhir Assessment 3 (Tugas Besar)',
        'time': '3 Hari 9 Jam Yang Lalu',
        'type': 'quiz',
      },
      {
        'message':
            'Anda telah mengirimkan pengajuan tugas untuk Pengumpulan Laporan Akhir Assessment 3 (Tugas Besar)',
        'time': '3 Hari 9 Jam Yang Lalu',
        'type': 'submission',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Notifikasi',
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
            // In Home Tab context, back usually means nothing or exit,
            // but if pushed it pops.
            // For consistency with other pages we keep the button visual.
          },
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notif = notifications[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 24.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Icon
                Icon(
                  notif['type'] == 'quiz'
                      ? Icons.chat_bubble_outline
                      : Icons.description_outlined,
                  size: 28,
                  color: Colors.black87,
                ),
                const SizedBox(width: 16),

                // Content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        notif['message'],
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500, // Medium/Semi-bold feel
                          color: Colors.black87,
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        notif['time'],
                        style: TextStyle(fontSize: 12, color: Colors.grey[600]),
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
