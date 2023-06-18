import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:studentlistbloc/domain/model/studentmode.dart';

part 'studentlist_event.dart';
part 'studentlist_state.dart';

class StudentlistBloc extends Bloc<StudentlistEvent, StudentlistState> {
  StudentlistBloc() : super(StudentlistInitial()) {
    // on<addingNewStudents>((event, emit) {
    //   state.allStudentListState.add(event.newobj);
    //   return emit(StudentlistState(allStudentListState: state.allStudentListState));
    // });

    on<addingNewStudentslist>((event, emit) {
      return emit(StudentlistState(allStudentListState: event.Newlist));
    });
  }
}
