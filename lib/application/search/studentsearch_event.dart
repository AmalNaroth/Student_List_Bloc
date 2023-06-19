part of 'studentsearch_bloc.dart';

@immutable
abstract class StudentsearchEvent {}

class NewStudentSearch extends StudentsearchEvent{
  List<StudentModel> newstudentsearchlist;
  NewStudentSearch({required this.newstudentsearchlist});
}