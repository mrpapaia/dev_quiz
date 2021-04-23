import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class AwnserWidget extends StatefulWidget {
  final String title;
  final bool isRigth;
  final bool isSelected;
  final VoidCallback onTap;
  final bool disabled;

  const AwnserWidget({
    Key? key,
    required this.title,
    this.isRigth = false,
    this.isSelected = false,
    required this.onTap,
    this.disabled = false,
  }) : super(key: key);

  @override
  _AwnserWidgetState createState() => _AwnserWidgetState();
}

class _AwnserWidgetState extends State<AwnserWidget> {
  Color get _selectedColorRigth =>
      widget.isRigth ? AppColors.darkGreen : AppColors.darkRed;

  Color get _selectedBorderRigth =>
      widget.isRigth ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedColorCardRigth =>
      widget.isRigth ? AppColors.lightGreen : AppColors.lightRed;

  Color get _selectedBorderCardRigth =>
      widget.isRigth ? AppColors.green : AppColors.red;

  TextStyle get _selectedTextStyleRigth =>
      widget.isRigth ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;

  IconData get _selectedIconRigth => widget.isRigth ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    print("entou");
    print(widget.isSelected);
    return IgnorePointer(
      ignoring: widget.disabled,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color:
                  widget.isSelected ? _selectedColorCardRigth : AppColors.white,
              border: Border.fromBorderSide(
                BorderSide(
                    color: widget.isSelected
                        ? _selectedBorderCardRigth
                        : AppColors.border),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.title,
                    style: widget.isSelected
                        ? _selectedTextStyleRigth
                        : AppTextStyles.body,
                  ),
                ),
                Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    color: widget.isSelected
                        ? _selectedColorRigth
                        : AppColors.white,
                    border: Border.fromBorderSide(
                      BorderSide(
                          color: widget.isSelected
                              ? _selectedBorderRigth
                              : AppColors.white),
                    ),
                    borderRadius: BorderRadius.circular(500),
                  ),
                  child: widget.isSelected
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
        ),
      ),
    );
  }
}
