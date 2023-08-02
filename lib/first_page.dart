import 'dart:developer';

import 'package:cubit_example/cubit/text_controller_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    TextControllerCubit cubit = BlocProvider.of<TextControllerCubit>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: cubit.textCtrl,
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                /// Direct Value Passing
                InkWell(
                  onTap: () {
                    cubit.textCtrl.text = "Hello";
                    cubit.rebuilds = 10 + cubit.rebuilds;
                  },
                  child: const Text("Function 1"),
                ),
                InkWell(
                  onTap: () {
                    cubit.assingValue("World");
                  },
                  child: const Text("Function 2"),
                ),
                InkWell(
                  onTap: () {
                    cubit.triggerState();
                  },
                  child: const Text("Function 2"),
                ),
              ],
            ),
            Text("Rebuit Data ${cubit.rebuilds}"),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<TextControllerCubit, TextControllerState>(
              builder: (context, state) {
                log("Rebuilted");
                if (state is TextControllerRebuilt) {
                  return Text("Rebuit Data ${state.rebuilts}");
                } else {
                  return const Text("Initial Data");
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
