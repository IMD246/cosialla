import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

import '../../../helpers/navigation/helper_navigation.dart';
import '../../../models/conversation.dart';
import '../../../models/user_profile.dart';
import '../../../theme/colors.dart';
import '../../searchChat/search_chat_page.dart';

class ConversationScreen<T> extends StatefulWidget {
  const ConversationScreen({
    super.key,
    required this.userProfile,
    required this.valueListConversation,
  });
  final UserProfile userProfile;
  final ValueStream<List<Conversation>?> valueListConversation;
  @override
  State<ConversationScreen> createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: white,
      appBar: PreferredSize(
        child: _getAppBar(),
        preferredSize: Size.fromHeight(0),
      ),
      body: _bodyConversationPage(),
      // body: BodyChatPage(),
    );
  }

  Widget _getAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: white,
    );
  }

  Widget _bodyConversationPage() {
    return StreamBuilder<List<Conversation>?>(
      stream: widget.valueListConversation,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final conversations = snapshot.data;
          return ListView.builder(
            itemCount: conversations?.length,
            itemBuilder: (context, index) {
              final conversation = conversations!.elementAt(index);
              return Text(
                conversation.toString(),
              );
            },
          );
        } else {
          return Column(
            children: [
              Spacer(),
              TextButton(
                onPressed: () {
                  HelperNavigation.push(
                    context: context,
                    widget: SearchChatPage(
                      ownerUserProfile: widget.userProfile,
                    ),
                  );
                },
                child: Text("You have no conversations!\t let make some"),
              ),
              Spacer()
            ],
          );
        }
      },
    );
  }
}
