import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:DevQuiz/home/widgets/chart_widget.dart';
import 'package:flutter/material.dart';

class ScoreCardWidget extends StatelessWidget {
  final value;

  const ScoreCardWidget({Key? key, required this.value}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 14),
      child: Container(
        height: 136,
        decoration: BoxDecoration(
            color: AppColors.white, borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: ChartWidget(
                  value: value,
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Vamos Começas",
                        style: AppTextStyles.heading,
                      ),
                      Text(
                        "Complete os desafios e avance em conhecimento",
                        style: AppTextStyles.body,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
