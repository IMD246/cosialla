import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/remote_repository/remote_user_presence_repository.dart';
import '../../repositories/remote_repository/remote_user_profile_repository.dart';
import '../../services/firebase_auth_provider.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  FirebaseAuthProvider firebaseAuthProvider =
      FirebaseAuthProvider.getInstance();
  final RemoteUserProfileRepository remoteUserProfileRepository;
  final RemoteUserPresenceRepository remoteUserPresenceRepository;
  AuthBloc({
    required this.remoteUserProfileRepository,
    required this.remoteUserPresenceRepository,
  }) : super(
          AuthStateLoggedOut(isLoading: false),
        ) {
    on<AuthEventInitialize>(
      (event, emit) async {
        try {
          emit(
            AuthStateLoggedOut(isLoading: true),
          );
          final getCurrentUser = await firebaseAuthProvider.currentUser;
          if (getCurrentUser != null) {
            var userProfile =
                await remoteUserProfileRepository.getUserProfileById(
              userID: getCurrentUser.uid,
            );
            if (userProfile == null) {
              await remoteUserProfileRepository.createUserProfile(
                user: getCurrentUser,
              );
            }
            userProfile = await remoteUserProfileRepository.getUserProfileById(
              userID: getCurrentUser.uid,
            );
            emit(
              AuthStateLoggedIn(
                isLoading: false,
                userProfile: userProfile!,
              ),
            );
          } else {
            emit(
              AuthStateLoggedOut(isLoading: false),
            );
          }
        } catch (e) {
          log(e.toString());
          emit(
            AuthStateLoggedOut(
              isLoading: false,
            ),
          );
        }
      },
    );
    on<AuthEventLoginByGoogle>(
      (event, emit) async {
        try {
          emit(
            AuthStateLoggedOut(isLoading: true),
          );
          final getSignInData = await firebaseAuthProvider.signInWithGoogle();
          if (getSignInData != null) {
            var userProfile =
                await remoteUserProfileRepository.getUserProfileById(
              userID: getSignInData.uid,
            );
            if (userProfile == null) {
              await remoteUserProfileRepository.createUserProfile(
                user: getSignInData,
              );
            }
            userProfile = await remoteUserProfileRepository.getUserProfileById(
              userID: getSignInData.uid,
            );
            emit(
              AuthStateLoggedIn(
                isLoading: false,
                userProfile: userProfile!,
              ),
            );
          }
          emit(
            AuthStateLoggedOut(isLoading: false),
          );
        } catch (e) {
          log(e.toString());
          emit(
            AuthStateLoggedOut(isLoading: false),
          );
        }
      },
    );
    on<AuthEventLogout>(
      (event, emit) async {
        try {
          emit(
            AuthStateLoggedIn(
              isLoading: true,
              userProfile: event.userProfile,
            ),
          );
          await firebaseAuthProvider.logout();
          emit(
            AuthStateLoggedOut(isLoading: false),
          );
        } catch (e) {
          emit(
            AuthStateLoggedIn(
              isLoading: false,
              userProfile: event.userProfile,
            ),
          );
        }
      },
    );
  }
}
