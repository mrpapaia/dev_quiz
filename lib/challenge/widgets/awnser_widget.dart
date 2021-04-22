import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class AwnserWidget extends StatelessWidget {
  final String title;
  final bool isRigth;
  final bool isSelected;

  const AwnserWidget({
    Key? key,
    required this.title,
    this.isRigth = false,
    this.isSelected = false,
  }) : super(key: key);

  Color get _selectedColorRigth =>
      isRigth ? AppColors.darkGreen : AppColors.darkRed;
  Color get _selectedBorderRigth =>
      isRigth ? AppColors.lightGreen : AppColors.lightRed;
  Color get _selectedColorCardRigth =>
      isRigth ? AppColors.lightGreen : AppColors.lightRed;
  Color get _selectedBorderCardRigth =>
      isRigth ? AppColors.green : AppColors.red;

  TextStyle get _selectedTextStyleRigth =>
      isRigth ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;
  IconData get _selectedIconRigth => isRigth ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? _selectedColorCardRigth : AppColors.white,
          border: Border.fromBorderSide(
            BorderSide(
                color:
                    isSelected ? _selectedBorderCardRigth : AppColors.border),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                title,
                style:
                    isSelected ? _selectedTextStyleRigth : AppTextStyles.body,
              ),
            ),
            Container(
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                color: isSelected ? _selectedColorRigth : AppColors.white,
                border: Border.fromBorderSide(
                  BorderSide(
                      color:
                          isSelected ? _selectedBorderRigth : AppColors.white),
                ),
                borderRadius: BorderRadius.circular(500),
              ),
              child: isSelected
                  ? Icon(
                      _selectedIconRigth,
                      size: 16,
                      color: Colors.white,
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
