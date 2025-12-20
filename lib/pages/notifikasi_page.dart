import 'package:flutter/material.dart';

class NotifikasiPage extends StatelessWidget {
  const NotifikasiPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> notifications = [
      {
        'title': 'Jadwal UAS Dirilis',
        'message':
            'Jadwal Ujian Akhir Semester Genap 2024/2025 telah tersedia. Silakan cek menu Akademik.',
        'time': 'Baru saya',
        'type': 'academic',
        'isRead': false,
      },
      {
        'title': 'Tugas Baru: Pemrograman Mobile',
        'message': 'Dosen telah menambahkan tugas baru "Final Project".',
        'time': '2 jam yang lalu',
        'type': 'task',
        'isRead': false,
      },
      {
        'title': 'Pengingat Pembayaran',
        'message':
            'Segera lakukan pembayaran UKT sebelum tanggal 20 Januari 2025.',
        'time': '1 hari yang lalu',
        'type': 'alert',
        'isRead': true,
      },
      {
        'title': 'Materi Baru: Kecerdasan Buatan',
        'message': 'Materi pertemuan 14 telah diunggah.',
        'time': '2 hari yang lalu',
        'type': 'material',
        'isRead': true,
      },
      {
        'title': 'Maintenance Server',
        'message':
            'Sistem akan mengalami gangguan pada tanggal 30 Desember pukul 00:00 - 04:00 WIB.',
        'time': '3 hari yang lalu',
        'type': 'system',
        'isRead': true,
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Notifikasi')),
      body: ListView.separated(
        itemCount: notifications.length,
        separatorBuilder: (context, index) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final notif = notifications[index];
          final isRead = notif['isRead'] as bool;

          return Container(
            color: isRead ? Colors.transparent : Colors.blue.withOpacity(0.05),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: _getIconColor(notif['type']).withOpacity(0.1),
                child: Icon(
                  _getIcon(notif['type']),
                  color: _getIconColor(notif['type']),
                  size: 20,
                ),
              ),
              title: Text(
                notif['title'],
                style: TextStyle(
                  fontWeight: isRead ? FontWeight.normal : FontWeight.bold,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text(
                    notif['message'],
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    notif['time'],
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                ],
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              onTap: () {
                // Mark as read or navigate logic
              },
            ),
          );
        },
      ),
    );
  }

  IconData _getIcon(String type) {
    switch (type) {
      case 'academic':
        return Icons.school;
      case 'task':
        return Icons.assignment;
      case 'alert':
        return Icons.warning;
      case 'material':
        return Icons.book;
      case 'system':
        return Icons.settings;
      default:
        return Icons.notifications;
    }
  }

  Color _getIconColor(String type) {
    switch (type) {
      case 'academic':
        return Colors.blue;
      case 'task':
        return Colors.orange;
      case 'alert':
        return Colors.red;
      case 'material':
        return Colors.green;
      case 'system':
        return Colors.grey;
      default:
        return Colors.blue;
    }
  }
}
