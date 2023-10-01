// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:todo_list_provider/shared/const/colors_const.dart';

class AddTodoIconWidget extends StatelessWidget {
  final void Function() goToAddTodoScreen;
  const AddTodoIconWidget({
    Key? key,
    required this.goToAddTodoScreen,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: goToAddTodoScreen,
      icon: const Icon(
        Icons.add,
        color: kSecondaryColor,
      ),
    );
  }
}
