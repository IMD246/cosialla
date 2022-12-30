import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

import '../../models/conversation.dart';
import '../../models/user_profile.dart';
import '../../repositories/remote_repository/remote_conversation_repository.dart';
import '../../repositories/remote_repository/remote_storage_repository.dart';
import '../../repositories/remote_repository/remote_user_presence_repository.dart';
import '../../repositories/remote_repository/remote_user_profile_repository.dart';
import 'conversation_event.dart';
import 'conversation_state.dart';

class ConversationBloc extends Bloc<ConversationEvent, ConversationState> {
  final RemoteConversationRepository remoteConversationRepository;
  final RemoteUserProfileRepository remoteUserProfileRepository;
  final RemoteUserPresenceRepository remoteUserPresenceRepository;
  final RemoteStorageRepository remoteStorageRepository;
  final UserProfile userProfile;
  BehaviorSubject<List<Conversation>?> _subjectListConversation =
      BehaviorSubject<List<Conversation>?>();

  ConversationBloc({
    required this.remoteConversationRepository,
    required this.remoteUserProfileRepository,
    required this.remoteUserPresenceRepository,
    required this.remoteStorageRepository,
    required this.userProfile,
  }) : super(
          ConversationInitializeState(
            ownerUserProfile: userProfile,
            subjectListConversation: BehaviorSubject(),
          ),
        ) {
    on<ConversationIntializeEvent>(
      (event, emit) async {
        try {
          await _getConversations();
          emit(
            ConversationOutsideRoomState(
              ownerUserProfile: userProfile,
              subjectListConversation: _subjectListConversation,
            ),
          );
        } catch (_) {
          emit(
            ConversationOutsideRoomState(
              ownerUserProfile: userProfile,
              subjectListConversation: BehaviorSubject(),
            ),
          );
        }
      },
    );
    on<ConversationOutsideRoomEvent>(
      (event, emit) {
        emit(
          ConversationOutsideRoomState(
            ownerUserProfile: userProfile,
            subjectListConversation: _subjectListConversation,
          ),
        );
      },
    );
    on<ConversationInsideRoomEvent>(
      (event, emit) {
        log(
          "not build yet!",
        );
      },
    );
  }
  Future<void> _getConversations() async {
    final listConversation =
        await remoteConversationRepository.getConversationsByUserId(
      userId: userProfile.id!,
    );
    _subjectListConversation.add(
      listConversation,
    );
  }
}
