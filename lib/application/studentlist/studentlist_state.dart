part of 'studentlist_bloc.dart';

 class StudentlistState {
  List<StudentModel> allStudentListState;
  StudentlistState({required this.allStudentListState});
 }

class StudentlistInitial extends StudentlistState {
  StudentlistInitial():super(allStudentListState: globalallStudentList);
}
