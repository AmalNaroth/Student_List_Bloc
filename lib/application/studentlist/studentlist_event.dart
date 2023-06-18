part of 'studentlist_bloc.dart';

@immutable
abstract class StudentlistEvent {}

class addingNewStudents extends StudentlistEvent{
  StudentModel newobj;
  addingNewStudents({required this.newobj});
}

class addingNewStudentslist extends StudentlistEvent{
  List<StudentModel> Newlist;
  addingNewStudentslist({required this.Newlist});
}