part of 'bottomnav_bloc.dart';

@immutable
abstract class BottomnavEvent {}

class screenchange extends BottomnavEvent{
  int? newIndex;
  screenchange({required this.newIndex});
}