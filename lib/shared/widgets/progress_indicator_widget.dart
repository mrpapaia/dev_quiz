import 'package:DevQuiz/core/core.dart';
import 'package:flutter/material.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  final double value;

  const ProgressIndicatorWidget({Key? key, required this.value})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: value,
      valueColor: AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
      backgroundColor: AppColors.chartSecondary,
    );
  }
}
