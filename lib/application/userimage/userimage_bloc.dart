import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'userimage_event.dart';
part 'userimage_state.dart';

class UserimageBloc extends Bloc<UserimageEvent, UserimageState> {
  UserimageBloc() : super(UserimageInitial()) {
    on<PickTheImage>((event, emit) {
      return emit(UserimageState(imagePth: event.newimagepth));
    });
  }
}
