part of 'authentication_bloc.dart';

@freezed
abstract class AuthenticationEvent with _$AuthenticationEvent {
  const factory AuthenticationEvent.signInEvent(
    String username,
    String password,
  ) = SignInEvent;
  const factory AuthenticationEvent.signOutEvent() = SignOutEvent;
  const factory AuthenticationEvent.appStarted() = AppStarted;
  const factory AuthenticationEvent.refreshToken() = RefreshToken;
}
