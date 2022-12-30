import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/constants/user_profile_field_constants.dart';
import '../../repositories/remote_repository/remote_storage_repository.dart';
import '../../repositories/remote_repository/remote_user_presence_repository.dart';
import '../../repositories/remote_repository/remote_user_profile_repository.dart';
import '../../services/firebase_auth_provider.dart';
import '../../utilities/handle_file.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  FirebaseAuthProvider firebaseAuthProvider =
      FirebaseAuthProvider.getInstance();
  final RemoteUserProfileRepository remoteUserProfileRepository;
  final RemoteUserPresenceRepository remoteUserPresenceRepository;
  final String tokenMessaging;
  final RemoteStorageRepository remoteStorageRepository;
  AuthBloc({
    required this.remoteUserProfileRepository,
    required this.remoteUserPresenceRepository,
    required this.remoteStorageRepository,
    required this.tokenMessaging,
  }) : super(
          AuthStateLoggedOut(isLoading: false),
        ) {
    on<AuthEventInitialize>(
      (event, emit) async {
        try {
          //Get current user from FirebaseAuth
          final getCurrentUser = await firebaseAuthProvider.currentUser;
          if (getCurrentUser != null) {
            emit(
              AuthStateLoggedOut(isLoading: true),
            );
            //get User from cloud firestore
            var userProfile =
                await remoteUserProfileRepository.getUserProfileById(
              userID: getCurrentUser.uid,
            );
            // check if userProfile null will be create
            if (userProfile == null) {
              await remoteUserProfileRepository.createUserProfile(
                user: getCurrentUser,
              );
            }

            //get data userProfile again after created
            userProfile = await remoteUserProfileRepository.getUserProfileById(
              userID: getCurrentUser.uid,
            );
            final userProfilePathName = "userProfile";
            final getUrlImageFromStorage =
                await remoteStorageRepository.getFile(
              filePath: userProfilePathName,
              fileName: userProfile!.id!,
            );
            if (getUrlImageFromStorage != null) {
              userProfile.urlImage = getUrlImageFromStorage;
            } else {
              final getFile = await UtilsDownloadFile.downloadFile(
                getCurrentUser.photoURL ?? "",
                getCurrentUser.uid,
              );
              await remoteStorageRepository.uploadFile(
                filePath: userProfilePathName,
                fileName: getCurrentUser.uid,
                file: File(
                  getFile ?? "",
                ),
              );
            }

            if (userProfile.messagingToken != tokenMessaging) {
              //update token messaging for userProfile
              await remoteUserProfileRepository.updateUserProfile(
                {
                  UserProfileFieldConstants.userMessagingTokenField:
                      tokenMessaging,
                },
                getCurrentUser.uid,
              );
              userProfile.messagingToken = tokenMessaging;
            }

            emit(
              AuthStateLoggedIn(
                isLoading: false,
                userProfile: userProfile,
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

            //get data userProfile again after created
            userProfile = await remoteUserProfileRepository.getUserProfileById(
              userID: getSignInData.uid,
            );
            final userProfilePathName = "userProfile";
            final getUrlImageFromStorage =
                await remoteStorageRepository.getFile(
              filePath: userProfilePathName,
              fileName: userProfile!.id!,
            );
            if (getUrlImageFromStorage != null) {
              userProfile.urlImage = getUrlImageFromStorage;
            } else {
              final getFile = await UtilsDownloadFile.downloadFile(
                getSignInData.photoURL ?? "",
                getSignInData.uid,
              );
              await remoteStorageRepository.uploadFile(
                filePath: userProfilePathName,
                fileName: getSignInData.uid,
                file: File(
                  getFile ?? "",
                ),
                settableMetaData: SettableMetadata(
                  contentType: 'image/jpeg,',
                ),
              );
              final getUrlImageFromStorage =
                  await remoteStorageRepository.getFile(
                filePath: userProfilePathName,
                fileName: userProfile.id!,
              );
              userProfile.urlImage = getUrlImageFromStorage;
            }
            if (userProfile.messagingToken != tokenMessaging) {
              //update token messaging for userProfile
              await remoteUserProfileRepository.updateUserProfile(
                {
                  UserProfileFieldConstants.userMessagingTokenField:
                      tokenMessaging,
                },
                userProfile.id!,
              );
              userProfile.messagingToken = tokenMessaging;
            }
            log(userProfile.toMap().toString());
            emit(
              AuthStateLoggedIn(
                isLoading: false,
                userProfile: userProfile,
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
