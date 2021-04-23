import 'package:DevQuiz/core/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NextButtonWidget extends StatelessWidget {
  final String label;
  final Color bgColor;
  final Color fontColor;
  final Color borderColor;
  final VoidCallback onTap;
  const NextButtonWidget(
      {Key? key,
      required this.label,
      required this.bgColor,
      required this.fontColor,
      required this.borderColor,
      required this.onTap})
      : super(key: key);
  NextButtonWidget.green({required String label, required VoidCallback onTap})
      : this.bgColor = AppColors.darkGreen,
        this.fontColor = AppColors.white,
        this.borderColor = AppColors.green,
        this.onTap = onTap,
        this.label = label;
  NextButtonWidget.white({required String label, required VoidCallback onTap})
      : this.bgColor = AppColors.white,
        this.fontColor = AppColors.grey,
        this.borderColor = AppColors.border,
        this.onTap = onTap,
        this.label = label;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 48,
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(bgColor),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            side: MaterialStateProperty.all(
              BorderSide(
                color: AppColors.border,
              ),
            ),
          ),
          onPressed: onTap,
          child: Text(
            label,
            style: GoogleFonts.notoSans(
              fontWeight: FontWeight.w600,
              fontSize: 15,
              color: fontColor,
            ),
          ),
        ),
      ),
    );
  }
}
