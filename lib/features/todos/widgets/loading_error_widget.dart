// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:todo_list_provider/shared/const/colors_const.dart';
import 'package:todo_list_provider/shared/widgets/texts/text_widget.dart';

class LoadingErrorWidget extends StatelessWidget {
  final bool isLoading;
  final String? error;
  final void Function() loadTodosAndDoneTodos;
  const LoadingErrorWidget({
    Key? key,
    required this.isLoading,
    required this.loadTodosAndDoneTodos,
    this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: isLoading
          ? const CircularProgressIndicator()
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextWidget(
                  error!,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 8,
                ),
                ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(kPrimaryColor)),
                  onPressed: loadTodosAndDoneTodos,
                  child: const TextWidget('Tentar Novamente'),
                ),
              ],
            ),
    );
  }
}
