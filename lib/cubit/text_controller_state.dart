part of 'text_controller_cubit.dart';

@immutable
abstract class TextControllerState {}

class TextControllerInitial extends TextControllerState {}

class TextControllerRebuilt extends TextControllerState {
  final int rebuilts;
  TextControllerRebuilt(this.rebuilts);
}
