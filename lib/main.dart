import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_provider/features/todos/controllers/todos_controller.dart';
import 'package:todo_list_provider/features/todos/screens/todos_screen.dart';
import 'package:todo_list_provider/shared/const/colors_const.dart';
import 'package:todo_list_provider/shared/services/local_storage/local_storage_service.dart';
import 'package:todo_list_provider/shared/services/local_storage/todos_local_storage_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TodosController(
        TodosLocalStorageService(
          LocalStorageService(),
        ),
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
          useMaterial3: true,
          scaffoldBackgroundColor: kBackgroundColor,
          appBarTheme: const AppBarTheme(
            backgroundColor: kBackgroundColor,
            titleTextStyle: TextStyle(
              color: kSecondaryColor,
              fontSize: 20,
            ),
          ),
        ),
        home: const TodosScreen(),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('pt', 'BR'),
        ],
      ),
    );
  }
}
