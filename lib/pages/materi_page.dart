import 'package:flutter/material.dart';

class MateriPage extends StatelessWidget {
  const MateriPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pengantar Flutter')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Material Title
            const Text(
              'Apa itu Flutter?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),

            // Material Description
            const Text(
              'Flutter adalah framework open source dari Google untuk membangun aplikasi multi-platform yang indah, dikompilasi secara native dari satu basis kode.\n\n'
              'Dalam sesi ini, kita akan mempelajari konsep dasar widget, struktur project, dan bagaimana Flutter bekerja di belakang layarrendering engine Skia/Impeller.',
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
                color: Colors.black54,
              ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 32),

            // Attachments Section
            const Text(
              'Materi Pendukung',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),

            // Attachment List
            _buildAttachmentItem(
              icon: Icons.video_library,
              color: Colors.red,
              title: 'Video Pengantar',
              subtitle: '10 Menit',
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Membuka Video...')),
                );
              },
            ),
            const SizedBox(height: 12),
            _buildAttachmentItem(
              icon: Icons.picture_as_pdf,
              color: Colors.redAccent,
              title: 'Slide Presentasi.pdf',
              subtitle: '2.5 MB',
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Mengunduh PDF...')),
                );
              },
            ),
            const SizedBox(height: 12),
            _buildAttachmentItem(
              icon: Icons.link,
              color: Colors.blue,
              title: 'Dokumentasi Resmi',
              subtitle: 'flutter.dev',
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Membuka Tautan...')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAttachmentItem({
    required IconData icon,
    required Color color,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: Colors.grey.shade300),
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: color),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.download_rounded, color: Colors.grey),
        onTap: onTap,
      ),
    );
  }
}
