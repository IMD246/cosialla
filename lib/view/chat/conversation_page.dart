import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../bloc/ConversationBloc/conversation_bloc.dart';
import '../../bloc/ConversationBloc/conversation_state.dart';
import '../../models/user_profile.dart';
import '../../provider/conversation_provider.dart';
import '../../provider/storage_provider.dart';
import '../../provider/user_presence_provider.dart';
import '../../provider/user_profile_provider.dart';
import '../../theme/colors.dart';
import 'components/conversation_screen.dart';

class ConversationPage extends StatefulWidget {
  const ConversationPage({Key? key, required this.userProfile})
      : super(key: key);
  final UserProfile userProfile;
  @override
  _ConversationPageState createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final conversationProvider = Provider.of<ConversationProvider>(context);
    final userProfileProvider = Provider.of<UserProfileProvider>(context);
    final userPresenceProvider = Provider.of<UserPresenceProvider>(context);
    final storageProvider = Provider.of<StorageProvider>(context);
    return BlocProvider<ConversationBloc>(
      create: (context) => ConversationBloc(
        remoteConversationRepository:
            conversationProvider.remoteConversationRepository,
        remoteUserProfileRepository:
            userProfileProvider.remoteUserProfileRepository,
        remoteUserPresenceRepository:
            userPresenceProvider.remoteUserPresenceRepository,
        remoteStorageRepository: storageProvider.remoteStorageRepository,
        userProfile: widget.userProfile,
      ),
      child: BlocBuilder<ConversationBloc, ConversationState>(
        builder: (context, state) {
          if (state is ConversationInitializeState) {
            return ConversationScreen(
              userProfile: state.ownerUserProfile,
              valueListConversation: state.subjectListConversation.stream,
            );
          } else if (state is ConversationOutsideRoomState) {
            return ConversationScreen(
              userProfile: state.ownerUserProfile,
              valueListConversation: state.subjectListConversation.stream,
            );
          } else {
            return Scaffold(
              backgroundColor: white,
              body: Container(
                child: Text(
                  "This state is not build yet!",
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
