import 'package:bloc/bloc.dart';
import 'package:the_academy_poker/presentation/reset_password_screen/reset_password_bloc/reset_password_event.dart';
import 'package:the_academy_poker/presentation/reset_password_screen/reset_password_bloc/reset_password_state.dart';


class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  ResetPasswordBloc() : super(ResetPasswordInitial());

  @override
  Stream<ResetPasswordState> mapEventToState(ResetPasswordEvent event) async* {
    if (event is NavigateToLogin) {
      yield NavigatedToLogin();
    }
  }
}
