import 'package:flutter/material.dart';
import 'detail_kelas_page.dart';

class KelasPage extends StatelessWidget {
  const KelasPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> courses = [
      {
        'name': 'Pemrograman Mobile',
        'lecturer': 'Budi Santoso, M.Kom',
        'schedule': 'Senin, 08:00 - 10:00',
        'progress': '0.75',
      },
      {
        'name': 'Basis Data Lanjut',
        'lecturer': 'Siti Aminah, M.T.',
        'schedule': 'Selasa, 10:00 - 12:00',
        'progress': '0.50',
      },
      {
        'name': 'Kecerdasan Buatan',
        'lecturer': 'Dr. Andi Wijaya',
        'schedule': 'Rabu, 13:00 - 15:00',
        'progress': '0.30',
      },
      {
        'name': 'Jaringan Komputer',
        'lecturer': 'Rudi Hermawan, S.T.',
        'schedule': 'Kamis, 08:00 - 10:00',
        'progress': '0.90',
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Kelas Saya')),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: courses.length,
        itemBuilder: (context, index) {
          final course = courses[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16.0),
            elevation: 2,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DetailKelasPage(),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      course['name']!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.person, size: 16, color: Colors.grey),
                        const SizedBox(width: 4),
                        Text(
                          course['lecturer']!,
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(
                          Icons.access_time,
                          size: 16,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          course['schedule']!,
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    LinearProgressIndicator(
                      value: double.parse(course['progress']!),
                      backgroundColor: Colors.grey[200],
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
