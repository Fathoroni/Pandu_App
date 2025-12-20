import 'package:flutter/material.dart';

class MateriPage extends StatelessWidget {
  const MateriPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Pengantar User Interface Design',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Deskripsi',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Antarmuka yang dibangun harus memperhatikan prinsip-prinsip desain yang ada. Hal ini diharapkan agar antarmuka yang dibangun bukan hanya menarik secara visual tetapi dengan memperhatikan kaidah-kaidah prinsip desain diharapkan akan mendukung pengguna dalam menggunakan produk secara baik. Pelajaran mengenai prinsip UID ini sudah pernah diajarkan dalam mata kuliah Implementasi Desain Antarmuka Pengguna tetap pada matakuliah ini akan direview kembali sehingga dapat menjadi bekal saat memasukki materi mengenai User Experience',
              style: TextStyle(
                fontSize: 14,
                height: 1.6,
                color: Colors.black87,
              ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 32),

            // Tab Switcher (Mock Visual only as per image, content matches "Lampiran Materi")
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey, width: 0.5),
                ),
              ),
              child: Row(
                children: [
                  Column(
                    children: [
                      const Text(
                        'Lampiran Materi',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(height: 3, width: 120, color: Colors.black),
                    ],
                  ),
                  const SizedBox(width: 24),
                  Column(
                    children: [
                      const Text(
                        'Tugas dan Kuis',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        height: 3,
                        width: 120,
                        color: Colors.transparent,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Attachment List
            _buildAttachmentItem(
              icon: Icons.link,
              title: 'Zoom Meeting Syncronous',
              isCompleted: true,
            ),
            _buildAttachmentItem(
              icon: Icons.description_outlined,
              title: 'Pengantar User Interface Design',
              isCompleted: true,
            ),
            _buildAttachmentItem(
              icon: Icons.description_outlined,
              title: 'Empat Teori Dasar Antarmuka Pengguna',
              isCompleted: true,
            ),
            _buildAttachmentItem(
              icon: Icons.description_outlined,
              title: 'Empat Teori Dasar Antarmuka Pengguna',
              isCompleted: true,
            ),
            _buildAttachmentItem(
              icon: Icons.video_library_outlined,
              title: 'User Interface Design for Beginner',
              isCompleted: true,
            ),
            _buildAttachmentItem(
              icon: Icons.link,
              title: '20 Prinsip Desain',
              isCompleted: true,
            ),
            _buildAttachmentItem(
              icon: Icons.link,
              title: 'Best Practice UI Design',
              isCompleted: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAttachmentItem({
    required IconData icon,
    required String title,
    required bool isCompleted,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, 2),
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, size: 24, color: Colors.black87),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ),
          if (isCompleted)
            const Icon(Icons.check_circle, color: Color(0xFF00C853), size: 24),
        ],
      ),
    );
  }
}
