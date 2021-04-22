import 'package:DevQuiz/core/core.dart';
import 'package:DevQuiz/shared/widgets/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuestionIndicatorWidget extends StatelessWidget {
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
                  "Quatão 4",
                  style: AppTextStyles.body,
                ),
                Text("de 10", style: AppTextStyles.body)
              ],
            ),
            SizedBox(
              height: 16,
            ),
            ProgressIndicatorWidget(value: 0.3),
          ],
        ),
      ),
    );
  }
}
