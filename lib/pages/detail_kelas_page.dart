import 'package:flutter/material.dart';

class DetailKelasPage extends StatelessWidget {
  const DetailKelasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Kelas')),
      body: const Center(
        child: Text(
          'Halaman Detail Kelas\n(Materi, Tugas, Kuis)',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      ),
    );
  }
}
