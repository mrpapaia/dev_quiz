import 'package:DevQuiz/core/core.dart';
import 'package:DevQuiz/shared/widgets/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  final int numQuestion;
  final int qtdQuestions;

  const QuestionIndicatorWidget({
    Key? key,
    required this.numQuestion,
    required this.qtdQuestions,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Quatão $numQuestion",
                  style: AppTextStyles.body,
                ),
                Text("de $qtdQuestions", style: AppTextStyles.body)
              ],
            ),
            SizedBox(
              height: 16,
            ),
            ProgressIndicatorWidget(value: numQuestion / qtdQuestions),
          ],
        ),
      ),
    );
  }
}
