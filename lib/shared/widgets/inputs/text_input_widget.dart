// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:todo_list_provider/shared/const/colors_const.dart';
import 'package:todo_list_provider/shared/widgets/texts/text_widget.dart';

class TextInputWidget extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String label;
  final bool autoFocus;
  final TextCapitalization textCapitalization;
  final String? Function(String?)? validator;
  final void Function(String)? onFieldSubmitted;
  final int? maxLines;
  final int? minLines;
  final void Function()? onTap;
  final bool readOnly;
  final TextInputAction textInputAction;

  const TextInputWidget({
    Key? key,
    required this.controller,
    required this.focusNode,
    required this.label,
    this.autoFocus = false,
    this.textCapitalization = TextCapitalization.none,
    this.validator,
    this.onFieldSubmitted,
    this.maxLines,
    this.minLines,
    this.onTap,
    this.readOnly = false,
    this.textInputAction = TextInputAction.next,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      autofocus: autoFocus,
      style: const TextStyle(color: kSecondaryColor),
      decoration: InputDecoration(
        label: TextWidget(label),
        border: const OutlineInputBorder(),
        labelStyle: const TextStyle(color: kSecondaryColor),
        floatingLabelStyle: const TextStyle(color: kSecondaryColor),
      ),
      textInputAction: textInputAction,
      textCapitalization: textCapitalization,
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      onTap: onTap,
      minLines: minLines,
      maxLines: maxLines,
      readOnly: readOnly,
    );
  }
}
