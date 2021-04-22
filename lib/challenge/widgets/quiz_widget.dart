import 'package:DevQuiz/challenge/widgets/awnser_widget.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatelessWidget {
  final String titulo;

  const QuizWidget({Key? key, required this.titulo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            titulo,
            style: AppTextStyles.heading,
          ),
          SizedBox(
            height: 24,
          ),
          Column(
            children: [
              AwnserWidget(
                title:
                    "Possibilita a criação de aplicativos compliados nativamente",
                isRigth: true,
                isSelected: true,
              ),
              AwnserWidget(
                title:
                    "Possibilita a criação de aplicativos compliados nativamente",
                isRigth: false,
                isSelected: true,
              ),
              AwnserWidget(
                title:
                    "Possibilita a criação de aplicativos compliados nativamente",
              ),
              AwnserWidget(
                title:
                    "Possibilita a criação de aplicativos compliados nativamente",
              ),
            ],
          )
        ],
      ),
    );
  }
}
