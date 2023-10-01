import 'package:flutter/material.dart';
import 'package:todo_list_provider/shared/const/colors_const.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final double fontSize;
  final TextAlign? textAlign;
  const TextWidget(this.text, {double? cFontSize, this.textAlign, super.key})
      : fontSize = cFontSize ?? 16;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: kSecondaryColor,
        fontSize: fontSize,
      ),
      textAlign: textAlign,
    );
  }
}
