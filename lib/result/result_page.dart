import 'package:flutter/material.dart';
import "package:share_plus/share_plus.dart";
import 'package:DevQuiz/challenge/widgets/next_button_widget.dart';
import 'package:DevQuiz/core/app_images.dart';
import 'package:DevQuiz/core/app_text_styles.dart';

class ResultPage extends StatelessWidget {
  final String title;
  final int length;
  final int qtdRigth;
  const ResultPage({
    Key? key,
    required this.title,
    required this.length,
    required this.qtdRigth,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 100),
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppImages.trophy),
            Column(
              children: [
                Text(
                  "Parabéns",
                  style: AppTextStyles.heading40,
                ),
                SizedBox(
                  height: 16,
                ),
                Text.rich(
                  TextSpan(
                    text: "Você concluiu",
                    style: AppTextStyles.body,
                    children: [
                      TextSpan(
                        text: "\n$title",
                        style: AppTextStyles.bodyBold,
                      ),
                      TextSpan(
                        text: "\ncom $qtdRigth de $length acertos.",
                        style: AppTextStyles.body,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 68),
                  child: Row(
                    children: [
                      NextButtonWidget.purble(
                          label: "Compartilhar",
                          onTap: () {
                            Share.share(
                                "DevQuiz - Resultado do Quiz: $title\nObtive ${(qtdRigth / length) * 100}% de aproveitamento");
                          }),
                    ],
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 68),
                  child: Row(
                    children: [
                      NextButtonWidget.white(
                          label: "Voltar ao ínicio",
                          onTap: () {
                            Navigator.pop(context);
                          }),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
