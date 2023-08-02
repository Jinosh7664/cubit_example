import 'package:cubit_example/cubit/text_controller_cubit.dart';
import 'package:cubit_example/first_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main(List<String> args) {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TextControllerCubit(),
      child: const MaterialApp(
        home: FirstPage(),
      ),
    );
  }
}
