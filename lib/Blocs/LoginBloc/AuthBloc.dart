import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itravel/Blocs/LoginBloc/AuthEvent.dart';
import 'package:itravel/Blocs/LoginBloc/AuthState.dart';

class AuthBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthBloc(AuthenticationState initialState) : super(initialState);

  @override
  AuthenticationState get initialState => Unintialized();

  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent event) {
    throw UnimplementedError();
  }
}
