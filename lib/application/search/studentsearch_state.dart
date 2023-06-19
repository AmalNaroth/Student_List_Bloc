part of 'studentsearch_bloc.dart';

 class StudentsearchState {
  List<StudentModel> studentsearchresult;
  StudentsearchState({required this.studentsearchresult});
 }

class StudentsearchInitial extends StudentsearchState {
  StudentsearchInitial() : super(studentsearchresult: globalallStudentList);
}
