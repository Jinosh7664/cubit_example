import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'text_controller_state.dart';

class TextControllerCubit extends Cubit<TextControllerState> {
  /// variable
  TextEditingController textCtrl = TextEditingController();
  int rebuilds = 0;

  TextControllerCubit() : super(TextControllerInitial());

  /// Using Methods
  void assingValue(String value) {
    textCtrl.text = value;
    emit(TextControllerRebuilt(rebuilds));
  }

  triggerState() async {
    emit(TextControllerInitial());
    await Future.delayed(const Duration(seconds: 2));
    ++rebuilds;
    emit(TextControllerRebuilt(rebuilds));
  }
}
