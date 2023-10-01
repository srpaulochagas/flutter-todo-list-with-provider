// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:todo_list_provider/shared/const/colors_const.dart';

class RemoveTodoIconWidget extends StatelessWidget {
  final void Function() removeTodo;

  const RemoveTodoIconWidget({
    Key? key,
    required this.removeTodo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.delete_outline,
        color: kSecondaryColor,
      ),
      onPressed: removeTodo,
    );
  }
}
