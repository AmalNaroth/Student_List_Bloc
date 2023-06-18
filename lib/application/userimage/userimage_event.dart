part of 'userimage_bloc.dart';

@immutable
abstract class UserimageEvent {}

class PickTheImage extends UserimageEvent{
  String newimagepth;
  PickTheImage({required this.newimagepth});
}