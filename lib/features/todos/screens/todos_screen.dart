import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_provider/features/todos/controllers/todos_controller.dart';
import 'package:todo_list_provider/features/todos/widgets/app_bar_title_text_widget.dart';
import 'package:todo_list_provider/features/todos/widgets/remove_todo_icon_widget.dart';
import 'package:todo_list_provider/shared/widgets/texts/text_widget.dart';

import '../../../shared/models/todo_model.dart';
import '../../add_todos/screens/add_todo_screen.dart';
import '../widgets/add_todo_icon_widget.dart';
import '../widgets/loading_error_widget.dart';
import '../widgets/todo_checkbox_widget.dart';
import '../widgets/todo_date_widget.dart';
import '../widgets/todo_title_and_description_widget.dart';

class TodosScreen extends StatefulWidget {
  const TodosScreen({super.key});

  @override
  State<TodosScreen> createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen> {
  bool isLoading = true;
  String? error;

  @override
  void initState() {
    WidgetsBinding.instance.addPersistentFrameCallback((timeStamp) {
      loadTodosAndDoneTodos();
    });
    super.initState();
  }

  Future<void> loadTodosAndDoneTodos() async {
    isLoading = true;
    error = null;

    final todosCtrl = context.read<TodosController>();

    final String? errorLoadingTodos = await todosCtrl.loadTodos();

    final String? errorLoadingDoneTodos = await todosCtrl.loadDoneTodos();

    if (errorLoadingTodos != null || errorLoadingDoneTodos != null) {
      setState(
        () {
          error = errorLoadingTodos ?? errorLoadingDoneTodos;
        },
      );
    }

    setState(() {
      isLoading = false;
    });
  }

  void _goToAddTodoScreen() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => const AddTodoScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final todosCtrl = context.watch<TodosController>();
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitleTextWidget(
          text: 'Lista de Tarefas',
          fontSize: 24,
          fontWeight: FontWeight.w500,
        ),
        actions: [
          AddTodoIconWidget(
            goToAddTodoScreen: _goToAddTodoScreen,
          ),
        ],
      ),
      body: isLoading || error != null
          ? LoadingErrorWidget(
              isLoading: isLoading,
              error: error,
              loadTodosAndDoneTodos: loadTodosAndDoneTodos,
            )
          : todosCtrl.todos.isEmpty
              ? const Center(
                  child: TextWidget('Você ainda não tem nenhuma tarefa'),
                )
              : ListView.builder(
                  itemCount: todosCtrl.todos.length,
                  itemBuilder: (_, int index) {
                    final TodoModel todo = todosCtrl.todos[index];
                    return Row(
                      children: [
                        TodoCheckboxWidget(todo),
                        const SizedBox(width: 6),
                        TodoTitleAndDescriptionWidget(todo),
                        TodoDateWidget(todo),
                        RemoveTodoIconWidget(
                          removeTodo: todosCtrl.deleteCheckedTodos,
                        ),
                      ],
                    );
                  },
                ),
    );
  }
}
