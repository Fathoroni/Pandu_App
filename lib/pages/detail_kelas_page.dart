import 'package:flutter/material.dart';
import 'materi_page.dart';

class DetailKelasPage extends StatelessWidget {
  const DetailKelasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Detail Kelas'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Materi'),
              Tab(text: 'Tugas dan Kuis'),
            ],
          ),
        ),
        body: TabBarView(children: [_MateriTab(), _TugasTab()]),
      ),
    );
  }
}

class _MateriTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> materials = [
      {'title': 'Pengantar Flutter', 'completed': true},
      {'title': 'Widget Dasar', 'completed': true},
      {'title': 'Layouting', 'completed': true},
      {'title': 'State Management', 'completed': false},
      {'title': 'Navigasi', 'completed': false},
      {'title': 'Koneksi API', 'completed': false},
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: materials.length,
      itemBuilder: (context, index) {
        final material = materials[index];
        return Card(
          elevation: 1,
          margin: const EdgeInsets.only(bottom: 8.0),
          child: ListTile(
            leading: Icon(
              material['completed']
                  ? Icons.check_circle
                  : Icons.circle_outlined,
              color: material['completed'] ? Colors.green : Colors.grey,
            ),
            title: Text(material['title']),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const MateriPage()),
              );
            },
          ),
        );
      },
    );
  }
}

class _TugasTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> tasks = [
      {
        'title': 'Kuis 1: Pengantar',
        'deadline': '10 Des 2025',
        'completed': true,
      },
      {
        'title': 'Tugas 1: Layout',
        'deadline': '15 Des 2025',
        'completed': true,
      },
      {'title': 'Final Project', 'deadline': '25 Des 2025', 'completed': false},
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return Card(
          elevation: 1,
          margin: const EdgeInsets.only(bottom: 8.0),
          child: ListTile(
            leading: Icon(
              task['completed'] ? Icons.assignment_turned_in : Icons.assignment,
              color: task['completed'] ? Colors.blue : Colors.orange,
            ),
            title: Text(task['title']),
            subtitle: Text('Tenggat: ${task['deadline']}'),
            trailing: task['completed']
                ? const Icon(Icons.check, color: Colors.green)
                : const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              // Placeholder for Task Detail
            },
          ),
        );
      },
    );
  }
}
