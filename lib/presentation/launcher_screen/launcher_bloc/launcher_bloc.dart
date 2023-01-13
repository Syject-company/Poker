import 'package:bloc/bloc.dart';
import 'package:the_academy_poker/presentation/launcher_screen/launcher_bloc/launcher_event.dart';
import 'package:the_academy_poker/presentation/launcher_screen/launcher_bloc/launcher_state.dart';

class LauncherBloc extends Bloc<LauncherEvent, LauncherState> {
  LauncherBloc() : super(LauncherInitial());

  @override
  Stream<LauncherState> mapEventToState(LauncherEvent event) async* {
    if (event is NavigateToLogIn) {
      yield NavigatedToLogIn();
    } else if (event is NavigateToRegister) {
      yield NavigatedToRegister();
    } else if (event is UpdateState) {
      yield StateUpdated();
    }
  }
}
