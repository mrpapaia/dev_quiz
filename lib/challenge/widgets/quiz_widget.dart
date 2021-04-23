import 'package:DevQuiz/challenge/widgets/awnser_widget.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:DevQuiz/shared/model/question_model.dart';
import 'package:flutter/material.dart';

class QuizWidget extends StatefulWidget {
  final QuestionModel question;
  final VoidCallback onChange;

  const QuizWidget({Key? key, required this.question, required this.onChange})
      : super(key: key);

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  int indexSelected = -1;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 64,
          ),
          Text(
            widget.question.title,
            style: AppTextStyles.heading,
          ),
          SizedBox(
            height: 24,
          ),
          for (var i = 0; i < widget.question.awnsers.length; i++)
            AwnserWidget(
              title: widget.question.awnsers[i].title,
              isRigth: widget.question.awnsers[i].isRigth,
              isSelected: indexSelected == i,
              disabled: indexSelected != -1,
              onTap: () {
                indexSelected = i;

                setState(() {});
                Future.delayed(Duration(seconds: 1))
                    .then((value) => widget.onChange());
              },
            ),
        ],
      ),
    );
  }
}
