part of 'bottomnav_bloc.dart';

@immutable
class BottomnavState {
  final currentIndex;
   const BottomnavState({required this.currentIndex});
}

class BottomnavInitial extends BottomnavState {
   const BottomnavInitial() : super(currentIndex: 0);
}
