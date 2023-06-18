import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bottomnav_event.dart';
part 'bottomnav_state.dart';

class BottomnavBloc extends Bloc<BottomnavEvent, BottomnavState> {
  BottomnavBloc() : super( const BottomnavInitial()) {
    on<screenchange>((event, emit) {
     return emit(BottomnavState(currentIndex:event.newIndex));
    });
  }
}
