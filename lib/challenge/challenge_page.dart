import 'package:DevQuiz/challenge/challenge_controller.dart';
import 'package:flutter/material.dart';

import 'package:DevQuiz/challenge/widgets/next_button_widget.dart';
import 'package:DevQuiz/challenge/widgets/question_indicator_widget.dart';
import 'package:DevQuiz/challenge/widgets/quiz_widget.dart';
import 'package:DevQuiz/shared/model/question_model.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;
  final int qtdResp;

  const ChallengePage({
    Key? key,
    required this.questions,
    required this.qtdResp,
  }) : super(key: key);
  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final pageController = PageController();
  nextPage() {
    if (controller.currentPage < widget.questions.length)
      pageController.nextPage(
          duration: Duration(milliseconds: 100), curve: Curves.linear);
  }

  @override
  void initState() {
    controller.currentPageNotifier.addListener(() {
      setState(() {});
    });
    pageController.addListener(() {
      controller.currentPage = pageController.page!.toInt() + 1;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(86),
        child: SafeArea(
            top: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackButton(),
                ValueListenableBuilder(
                  valueListenable: controller.currentPageNotifier,
                  builder: (context, value, _) => QuestionIndicatorWidget(
                    qtdQuestions: widget.questions.length,
                    numQuestion: controller.currentPage,
                  ),
                ),
              ],
            )),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: widget.questions
            .map((e) => QuizWidget(
                  question: e,
                  onChange: () {
                    nextPage();
                  },
                ))
            .toList(),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ValueListenableBuilder<int>(
            valueListenable: controller.currentPageNotifier,
            builder: (context, value, _) => Row(
              children: [
                if (value < widget.questions.length)
                  NextButtonWidget.white(
                    label: "Pular",
                    onTap: () {
                      nextPage();
                    },
                  ),
                if (value == widget.questions.length)
                  NextButtonWidget.green(
                      label: "Confirmar",
                      onTap: () {
                        Navigator.pop(context);
                      })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
