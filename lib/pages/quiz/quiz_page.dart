import 'dart:async';
import 'package:flutter/material.dart';
import 'quiz_result_page.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentQuestionIndex = 0;
  Timer? _timer;
  int _remainingSeconds = 600; // 10 minutes

  // Selected answers: questionIndex -> answerIndex (0=A,1=B, etc)
  final Map<int, int> _selectedAnswers = {};

  final List<Map<String, dynamic>> _questions = [
    {
      "id": 1,
      "question": "Radio button dapat digunakan untuk menentukan ?",
      "options": [
        "Jenis Kelamin",
        "Alamat",
        "Hobby",
        "Riwayat Pendidikan",
        "Umur",
      ],
      "correct": 0, // A
    },
    {
      "id": 2,
      "question":
          "Dalam perancangan web yang baik, untuk teks yang menyampaikan isi konten digunakan font yang sama di setiap halaman, ini merupakan salah satu tujuan yaitu ?",
      "options": [
        "Intergrasi",
        "Standarisasi",
        "Konsistensi",
        "Koefensi",
        "Koreksi",
      ],
      "correct": 2, // C
    },
    {
      "id": 3,
      "question":
          "Berikut ini yang bukan merupakan prinsip desain antarmuka adalah?",
      "options": [
        "User Compatibility",
        "Product Compatibility",
        "Task Compatibility",
        "Complex Workflow",
        "Workflow Compatibility",
      ],
      "correct": 3, // D (Complex Workflow is not a principle usually)
    },
  ];

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 0) {
        setState(() {
          _remainingSeconds--;
        });
      } else {
        _timer?.cancel();
        submitQuiz();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String get timerText {
    final minutes = (_remainingSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (_remainingSeconds % 60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  void submitQuiz() {
    _timer?.cancel();
    int score = 0;
    _questions.asMap().forEach((index, q) {
      if (_selectedAnswers[index] == q['correct']) {
        score++;
      }
    });

    // Calculate final score out of 100
    double finalScore = (score / _questions.length) * 100;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => QuizResultPage(
          score: finalScore,
          questions: _questions,
          userAnswers: _selectedAnswers,
        ),
      ),
    );
  }

  void nextQuestion() {
    if (_currentQuestionIndex < _questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
      });
    } else {
      submitQuiz();
    }
  }

  void prevQuestion() {
    if (_currentQuestionIndex > 0) {
      setState(() {
        _currentQuestionIndex--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final primary = const Color(0xFF3B82F6);
    final surfaceColor = isDark ? const Color(0xFF1F2937) : Colors.white;
    final backgroundColor = isDark
        ? const Color(0xFF111827)
        : const Color(0xFFF3F4F6);
    final textPrimary = isDark
        ? const Color(0xFFF9FAFB)
        : const Color(0xFF1F2937);

    final question = _questions[_currentQuestionIndex];

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          // Header with Curves
          Container(
            padding: const EdgeInsets.only(
              top: 48,
              bottom: 32,
              left: 24,
              right: 24,
            ),
            decoration: BoxDecoration(
              color: primary,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(32),
                bottomRight: Radius.circular(32),
              ),
              boxShadow: [
                BoxShadow(
                  color: primary.withOpacity(0.3),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.1),
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.timer,
                            color: Colors.white,
                            size: 18,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            timerText,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'monospace',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  'Quiz Review 1',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Bahasa Pemrograman Dasar',
                  style: TextStyle(
                    color: Colors.blue[100],
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: Container(
              color: backgroundColor, // ensure bg matches
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    // Question Navigation
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: surfaceColor,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: isDark ? Colors.grey[700]! : Colors.grey[200]!,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: _questions.asMap().entries.map((entry) {
                          final idx = entry.key;
                          final isCurrent = idx == _currentQuestionIndex;
                          final isAnswered = _selectedAnswers.containsKey(idx);

                          Color bgColor;
                          Color textColor;

                          if (isCurrent) {
                            bgColor = primary;
                            textColor = Colors.white;
                          } else if (isAnswered) {
                            bgColor = Colors.green;
                            textColor = Colors.white;
                          } else {
                            bgColor = isDark ? Colors.grey[700]! : Colors.white;
                            textColor = isDark
                                ? Colors.grey[300]!
                                : Colors.grey[500]!;
                          }

                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _currentQuestionIndex = idx;
                              });
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              margin: const EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                color: bgColor,
                                shape: BoxShape.circle,
                                border: isCurrent || isAnswered
                                    ? null
                                    : Border.all(color: Colors.grey[300]!),
                                boxShadow: isCurrent
                                    ? [
                                        BoxShadow(
                                          color: primary.withOpacity(0.4),
                                          blurRadius: 8,
                                          offset: const Offset(0, 4),
                                        ),
                                      ]
                                    : null,
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                (idx + 1).toString(),
                                style: TextStyle(
                                  color: textColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Question Text
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: isDark
                              ? Colors.blue[900]!.withOpacity(0.3)
                              : Colors.blue[50],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'SOAL NOMOR ${_currentQuestionIndex + 1} / ${_questions.length}',
                          style: TextStyle(
                            color: primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      question['question'],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: textPrimary,
                        height: 1.5,
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Options
                    ...List.generate((question['options'] as List).length, (
                      index,
                    ) {
                      final optionLabel = String.fromCharCode(
                        65 + index,
                      ); // A, B, C...
                      final optionText = question['options'][index];
                      final isSelected =
                          _selectedAnswers[_currentQuestionIndex] == index;

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedAnswers[_currentQuestionIndex] = index;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? (isDark
                                      ? Colors.blue[900]!.withOpacity(0.2)
                                      : Colors.blue[50])
                                : surfaceColor,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: isSelected
                                  ? primary
                                  : (isDark
                                        ? Colors.grey[700]!
                                        : Colors.grey[200]!),
                              width: isSelected ? 2 : 1,
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? primary
                                      : (isDark
                                            ? Colors.grey[700]
                                            : Colors.grey[100]),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  optionLabel,
                                  style: TextStyle(
                                    color: isSelected
                                        ? Colors.white
                                        : (isDark
                                              ? Colors.grey[400]
                                              : Colors.grey[500]),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Text(
                                  optionText,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: isSelected
                                        ? FontWeight.w600
                                        : FontWeight.normal,
                                    color: isSelected
                                        ? (isDark ? Colors.blue[200] : primary)
                                        : textPrimary,
                                  ),
                                ),
                              ),
                              if (isSelected)
                                Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: primary,
                                      width: 2,
                                    ),
                                  ),
                                  padding: const EdgeInsets.all(2),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: primary,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      );
                    }),

                    const SizedBox(
                      height: 80,
                    ), // Bottom padding for fixed footer
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: surfaceColor,
          border: Border(
            top: BorderSide(
              color: isDark ? Colors.grey[800]! : Colors.grey[200]!,
            ),
          ),
        ),
        child: Row(
          children: [
            if (_currentQuestionIndex > 0)
              Expanded(
                child: OutlinedButton(
                  onPressed: prevQuestion,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: isDark
                        ? Colors.grey[300]
                        : Colors.grey[600],
                    side: BorderSide(
                      color: isDark ? Colors.grey[600]! : Colors.grey[300]!,
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.arrow_back, size: 18),
                      SizedBox(width: 8),
                      Text('Soal Sebelumnya'),
                    ],
                  ),
                ),
              )
            else
              const Spacer(),

            const SizedBox(width: 16),

            Expanded(
              child: ElevatedButton(
                onPressed: nextQuestion,
                style: ElevatedButton.styleFrom(
                  backgroundColor: primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 4,
                  shadowColor: primary.withOpacity(0.4),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _currentQuestionIndex == _questions.length - 1
                          ? 'Selesai'
                          : 'Soal Selanjutnya',
                    ),
                    const SizedBox(width: 8),
                    if (_currentQuestionIndex < _questions.length - 1)
                      const Icon(Icons.arrow_forward, size: 18)
                    else
                      const Icon(Icons.check, size: 18),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
