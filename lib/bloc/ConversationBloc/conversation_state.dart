import 'package:rxdart/rxdart.dart';

import '../../models/conversation.dart';
import '../../models/user_profile.dart';

abstract class ConversationState {}

class ConversationInitializeState extends ConversationState {
  final BehaviorSubject<List<Conversation>?> subjectListConversation;
  final UserProfile ownerUserProfile;
  ConversationInitializeState({
    required this.subjectListConversation,
    required this.ownerUserProfile,
  });
}

class ConversationInsideRoomState extends ConversationState {}

class ConversationOutsideRoomState extends ConversationState {
  final BehaviorSubject<List<Conversation>?> subjectListConversation;
  final UserProfile ownerUserProfile;
  ConversationOutsideRoomState({
    required this.subjectListConversation,
    required this.ownerUserProfile,
  });
}
