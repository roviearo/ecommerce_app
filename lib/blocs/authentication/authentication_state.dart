part of 'authentication_bloc.dart';

@freezed
abstract class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState.initial() = Initial;
  const factory AuthenticationState.authenticated(AuthResponseModel user) =
      Authenticated;
  const factory AuthenticationState.unauthenticated() = Unauthenticated;
  const factory AuthenticationState.signingIn() = SigningIn;
  const factory AuthenticationState.signingOut() = SigningOut;
  const factory AuthenticationState.signedOut() = SignedOut;
  const factory AuthenticationState.authenticationError(String messages) =
      AuthenticationError;
}
