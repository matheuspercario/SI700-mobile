import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_database/auth_provider/firebase_auth.dart';
import 'package:flutter_database/logic/manage_auth/auth_event.dart';
import 'package:flutter_database/logic/manage_auth/auth_state.dart';
import 'package:flutter_database/model/user.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  StreamSubscription _authenticationStream;
  FirebaseAuthenticationService _authenticationService;

  AuthBloc() : super(Unauthenticated()) {
    _authenticationService = FirebaseAuthenticationService();
    _authenticationStream = _authenticationService.user.listen(
      (UserModel userModel) {
        add(InnerServerEvent(userModel));
      },
    );
  }

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    try {
      if (event == null) {
        yield Unauthenticated();
      } else if (event is RegisterUser) {
        await _authenticationService.createUserWithEmailAndPassword(
          email: event.username,
          password: event.password,
        );
      } else if (event is LoginAnonymousUser) {
        await _authenticationService.signInAnonimo();
      } else if (event is LoginUser) {
        await _authenticationService.signInWithEmailAndPassword(
          email: event.username,
          password: event.password,
        );
      } else if (event is InnerServerEvent) {
        if (event.userModel == null) {
          yield Unauthenticated();
        } else {
          yield Authenticated(user: event.userModel);
        }
      } else if (event is Logout) {
        await _authenticationService.signOut();
      }
    } catch (e) {
      yield AuthError(message: e.toString());
    }
  }
}
