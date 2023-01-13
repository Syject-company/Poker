import 'package:bloc/bloc.dart';
import 'package:the_academy_poker/presentation/settings_screen/settings_bloc/settings_event.dart';
import 'package:the_academy_poker/presentation/settings_screen/settings_bloc/settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsInitial());

  @override
  Stream<SettingsState> mapEventToState(SettingsEvent event) async* {
    if (event is Navigate) {
      yield Navigated();
    }
    /*else if (event is NavigateToSignUp) {
      yield NavigatedToSignUp();
    }*/
  }
}
