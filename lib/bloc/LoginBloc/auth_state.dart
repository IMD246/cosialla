import '../../models/user_profile.dart';

abstract class AuthState {
  final bool isLoading;
  final String textLoading;
  AuthState({
    required this.isLoading,
    this.textLoading = "Please wait a minute",
  });
}

class AuthStateLoggedOut extends AuthState {
  AuthStateLoggedOut({required bool isLoading}) : super(isLoading: isLoading);
}

class AuthStateLoggedIn extends AuthState {
  final UserProfile userProfile;
  AuthStateLoggedIn({
    required this.userProfile,
    required bool isLoading,
  }) : super(
          isLoading: isLoading,
        );
}
