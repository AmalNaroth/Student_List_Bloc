import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:studentlistbloc/domain/model/studentmode.dart';

part 'studentsearch_event.dart';
part 'studentsearch_state.dart';

class StudentsearchBloc extends Bloc<StudentsearchEvent, StudentsearchState> {
  StudentsearchBloc() : super(StudentsearchInitial()) {
    on<NewStudentSearch>((event, emit) {
      return emit(StudentsearchState(studentsearchresult: event.newstudentsearchlist));
    });
  }
}
