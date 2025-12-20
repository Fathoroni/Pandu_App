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
          backgroundColor: const Color(0xFFB71C1C), // Deep Red
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text(
            'DESAIN ANTARMUKA & PENGALAMAN\nPENGGUNA D4SM-42-03 [ADY]',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
          bottom: const TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.black,
            indicatorWeight: 3,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            tabs: [
              Tab(text: 'Materi'),
              Tab(text: 'Tugas Dan Kuis'),
            ],
          ),
        ),
        // White background for the TabBar container effect
        backgroundColor: Colors.grey[100],
        body: Container(
          color: Colors.white, // Background for the body
          child: TabBarView(children: [_MateriTab(), _TugasTab()]),
        ),
      ),
    );
  }
}

class _MateriTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> sessions = [
      {
        'label': 'Pertemuan 1',
        'title': '01 - Pengantar User Interface Design',
        'info': '3 URLs, 2 Files, 3 Interactive Content',
        'isCompleted': true,
      },
      {
        'label': 'Pertemuan 2',
        'title': '02 - Konsep User Interface Design',
        'info': '2 URLs, 1 Kuis, 3 Files, 1 Tugas',
        'isCompleted': true,
      },
      {
        'label': 'Pertemuan 3',
        'title': '03 - Interaksi pada User Interface Design',
        'info': '3 URLs, 2 Files, 3 Interactive Content',
        'isCompleted': true,
      },
      {
        'label': 'Pertemuan 4',
        'title': '04 - Ethnographic Observation',
        'info': '3 URLs, 2 Files, 3 Interactive Content',
        'isCompleted': true,
      },
      {
        'label': 'Pertemuan 5',
        'title': '05 - UID Testing',
        'info': '3 URLs, 2 Files, 3 Interactive Content',
        'isCompleted': true,
      },
      {
        'label': 'Pertemuan 6',
        'title': '06 - Assessment 1',
        'info': '3 URLs, 2 Files, 3 Interactive Content',
        'isCompleted': true,
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: sessions.length,
      itemBuilder: (context, index) {
        final session = sessions[index];
        return Card(
          color: Colors.white,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          margin: const EdgeInsets.only(bottom: 16.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MateriPage()),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          session['label'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      if (session['isCompleted'])
                        const Icon(
                          Icons.check_circle,
                          color: Colors.green,
                          size: 24,
                        ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    session['title'],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    session['info'],
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _TugasTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> items = [
      {
        'type': 'Quiz',
        'title': 'Quiz Review 01',
        'due': '26 Februari 2021 23:59 WIB',
        'isCompleted': true,
      },
      {
        'type': 'Tugas',
        'title': 'Tugas 01 - UID Android Mobile Game',
        'due': '26 Februari 2021 23:59 WIB',
        'isCompleted':
            true, // Grey checkmark in ref image usually implies submitted/done
      },
      {
        'type': 'Quiz',
        'title': 'Kuis - Assessment 2',
        'due': '26 Februari 2021 23:59 WIB',
        'isCompleted': true,
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Card(
          color: Colors.white,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          margin: const EdgeInsets.only(bottom: 16.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: InkWell(
              onTap: () {
                // Placeholder for detail navigation
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blue, // Light blue for tag
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          item['type'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.check_circle,
                        color: item['isCompleted']
                            ? Colors.green
                            : Colors.grey[300],
                        size: 24,
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      // Icons based on type
                      item['type'] == 'Quiz'
                          ? const Icon(
                              Icons.chat_bubble_outline,
                              size: 30,
                            ) // Quiz icon approximation
                          : const Icon(
                              Icons.assignment_outlined,
                              size: 30,
                            ), // Task icon
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          item['title'],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Tenggat Waktu : ${item['due']}',
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
