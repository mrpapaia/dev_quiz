import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/core/app_images.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:DevQuiz/shared/widgets/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class QuizCardWidget extends StatelessWidget {
  final String title;
  final int completed;
  final String image;
  final int numAwnser;
  const QuizCardWidget(
      {Key? key,
      required this.title,
      required this.completed,
      required this.image,
      required this.numAwnser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.fromBorderSide(
            BorderSide(color: AppColors.border),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 40,
              width: 40,
              child: Image.asset(image),
            ),
            SizedBox(
              height: 24,
            ),
            Text(
              title,
              style: AppTextStyles.heading15,
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Text(
                    "${completed} de ${numAwnser} ",
                    style: AppTextStyles.body11,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: ProgressIndicatorWidget(value: completed / numAwnser),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
