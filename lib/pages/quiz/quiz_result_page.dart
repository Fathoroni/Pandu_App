import 'package:flutter/material.dart';

class QuizResultPage extends StatelessWidget {
  final double score;
  final List<Map<String, dynamic>> questions;
  final Map<int, int> userAnswers;

  const QuizResultPage({
    super.key,
    required this.score,
    required this.questions,
    required this.userAnswers,
  });

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

    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.only(
              top: 48,
              bottom: 24,
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
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => Navigator.pop(
                    context,
                  ), // Should go back to MateriPage normally
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.0),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                ),
                const Text(
                  'Review Jawaban',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: const Icon(
                    Icons.more_vert,
                    color: Colors.transparent,
                  ), // Spacer
                ),
              ],
            ),
          ),

          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  // Summary Card
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: surfaceColor,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: isDark ? Colors.grey[700]! : Colors.grey[200]!,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 2,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        _buildSummaryRow(
                          "Di Mulai Pada",
                          "Kamis 25 Feb 2021 10:25",
                          isDark,
                          textPrimary,
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Status",
                              style: TextStyle(
                                color: isDark
                                    ? Colors.grey[400]
                                    : Colors.grey[500],
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 2,
                              ),
                              decoration: BoxDecoration(
                                color: isDark
                                    ? const Color(0xFF064E3B)
                                    : const Color(0xFFDCFCE7),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                "Selesai",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: isDark
                                      ? const Color(0xFFA7F3D0)
                                      : const Color(0xFF166534),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        _buildSummaryRow(
                          "Selesai Pada",
                          "Kamis 25 Feb 2021 10:40",
                          isDark,
                          textPrimary,
                        ),
                        const SizedBox(height: 12),
                        _buildSummaryRow(
                          "Waktu Penyelesaian",
                          "?? Menit",
                          isDark,
                          textPrimary,
                        ), // Placeholder
                        Divider(
                          height: 24,
                          color: isDark ? Colors.grey[700] : Colors.grey[200],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Nilai",
                              style: TextStyle(
                                color: isDark
                                    ? Colors.grey[400]
                                    : Colors.grey[500],
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              "${score.toInt()} / 100",
                              style: TextStyle(
                                color: primary,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Questions Review
                  ...questions.asMap().entries.map((entry) {
                    final index = entry.key;
                    final q = entry.value;
                    final userAnswerIdx = userAnswers[index];
                    final correctIdx = q['correct'];
                    final isCorrect = userAnswerIdx == correctIdx;

                    final userAnswerLabel = userAnswerIdx != null
                        ? String.fromCharCode(65 + userAnswerIdx)
                        : "-";
                    final userAnswerText = userAnswerIdx != null
                        ? q['options'][userAnswerIdx]
                        : "Tidak dijawab";

                    return Container(
                      margin: const EdgeInsets.only(bottom: 24),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: surfaceColor,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: isDark ? Colors.grey[700]! : Colors.grey[200]!,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            blurRadius: 2,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "PERTANYAAN ${index + 1}",
                                style: TextStyle(
                                  color: primary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                  letterSpacing: 0.5,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Lihat Soal",
                                    style: TextStyle(
                                      color: Colors.blue[400],
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  Icon(
                                    Icons.open_in_new,
                                    size: 14,
                                    color: Colors.blue[400],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Container(
                            padding: const EdgeInsets.all(16),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: isDark
                                  ? Colors.blue[900]!.withOpacity(0.2)
                                  : Colors.blue[50], // Blue-50 equivalent
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: isDark
                                    ? Colors.blue[900]!.withOpacity(0.3)
                                    : Colors.blue[100]!,
                              ),
                            ),
                            child: Text(
                              q['question'],
                              style: TextStyle(
                                color: textPrimary,
                                fontSize: 13,
                                height: 1.5,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            "JAWABAN TERSIMPAN",
                            style: TextStyle(
                              color: isDark
                                  ? Colors.grey[500]
                                  : Colors.grey[400],
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  color: isCorrect
                                      ? (isDark
                                            ? Colors.green[900]!.withOpacity(
                                                0.4,
                                              )
                                            : Colors.green[100])
                                      : (isDark
                                            ? Colors.red[900]!.withOpacity(0.4)
                                            : Colors.red[100]),
                                  shape: BoxShape.circle,
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  userAnswerLabel,
                                  style: TextStyle(
                                    color: isCorrect
                                        ? (isDark
                                              ? Colors.green[300]
                                              : Colors.green[700])
                                        : (isDark
                                              ? Colors.red[300]
                                              : Colors.red[700]),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  userAnswerText,
                                  style: TextStyle(
                                    color: textPrimary,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                              Icon(
                                isCorrect ? Icons.check_circle : Icons.cancel,
                                color: isCorrect ? Colors.green : Colors.red,
                                size: 20,
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
          ),

          // Bottom Bar
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: surfaceColor,
              border: Border(
                top: BorderSide(
                  color: isDark ? Colors.grey[800]! : Colors.grey[100]!,
                ),
              ),
            ),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  // Pop until we reach MateriPage
                  Navigator.popUntil(
                    context,
                    (route) =>
                        route.isFirst || route.settings.name == '/materi',
                  );
                  // Since we didn't name routes properly, pop twice assumes QuizPage replaced itself? No pushReplacement replaced QuizPage. So one pop goes back to StartPage or MateriPage?
                  // QuizStartPage --push--> QuizPage --replace--> QuizResultPage.
                  // So pop goes to QuizStartPage.
                  Navigator.pop(context);
                },
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
                icon: const Icon(Icons.send, size: 20),
                label: const Text(
                  'Kirim Jawaban (Selesai)',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(
    String label,
    String value,
    bool isDark,
    Color textPrimary,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            color: isDark ? Colors.grey[400] : Colors.grey[500],
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            color: textPrimary,
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
