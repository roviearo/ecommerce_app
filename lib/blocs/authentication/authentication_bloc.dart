import 'package:ecommerce_app/repositories/auth_repository.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:ecommerce_app/models/auth_response_model.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';
part 'authentication_bloc.freezed.dart';

class AuthenticationBloc
    extends HydratedBloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({required AuthRepository repository})
    : _repository = repository,
      super(Initial()) {
    on<AppStarted>(_onAppStarted);
    on<SignInEvent>(_onSignInEvent);
    on<SignOutEvent>(_onSignOutEvent);
    on<RefreshToken>(_onRefreshToken);
  }
  final AuthRepository _repository;

  _onAppStarted(AppStarted event, Emitter<AuthenticationState> emit) async {
    if (state is Authenticated) {
      try {
        final user = await _repository.getMe();
        emit(Authenticated(user));
      } catch (e) {
        emit(Unauthenticated());
      }
    } else {
      emit(Unauthenticated());
    }
  }

  _onSignInEvent(SignInEvent event, Emitter<AuthenticationState> emit) async {
    emit(SigningIn());
    try {
      final user = await _repository.login(event.username, event.password);
      emit(Authenticated(user));
    } catch (e) {
      emit(AuthenticationError(e.toString()));
    }
  }

  _onSignOutEvent(SignOutEvent event, Emitter<AuthenticationState> emit) async {
    emit(SigningOut());
    try {
      await _repository.logout();
      emit(Unauthenticated());
    } catch (e) {
      emit(Unauthenticated());
    }
  }

  _onRefreshToken(RefreshToken event, Emitter<AuthenticationState> emit) async {
    if (state is Authenticated) return;

    try {
      final currentUser = (state as Authenticated).user;
      final refreshed = await _repository.refreshToken(
        currentUser.refreshToken,
      );
      emit(Authenticated(refreshed));
    } catch (e) {
      emit(Unauthenticated());
    }
  }

  @override
  AuthenticationState? fromJson(Map<String, dynamic> json) {
    try {
      return Authenticated(
        AuthResponseModel.fromJson(json['user'] as Map<String, dynamic>),
      );
    } catch (_) {
      return Unauthenticated();
    }
  }

  @override
  Map<String, dynamic>? toJson(AuthenticationState state) {
    return state.maybeWhen(
      authenticated: (user) => {'user': user.toJson()},
      orElse: () => null,
    );
  }
}
