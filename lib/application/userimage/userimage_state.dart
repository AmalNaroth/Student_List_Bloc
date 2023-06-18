part of 'userimage_bloc.dart';

 class UserimageState {
  String imagePth;
  UserimageState({required this.imagePth});
 }

class UserimageInitial extends UserimageState {
  UserimageInitial(): super(imagePth:"");
}
