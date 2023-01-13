import 'package:bloc/bloc.dart';
import 'package:the_academy_poker/presentation/signup_screen/signup_bloc/signup_event.dart';
import 'package:the_academy_poker/presentation/signup_screen/signup_bloc/signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial());

  @override
  Stream<SignupState> mapEventToState(SignupEvent event) async* {
    if (event is NavigateToLogin) {
      yield NavigatedToLogin();
    }
  }
}
