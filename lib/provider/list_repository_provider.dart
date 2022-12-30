import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../repositories/remote_repository/remote_conversation_repository.dart';
import '../repositories/remote_repository/remote_post_media_repository.dart';
import '../repositories/remote_repository/remote_post_repository.dart';
import '../repositories/remote_repository/remote_storage_repository.dart';
import '../repositories/remote_repository/remote_user_presence_repository.dart';
import '../repositories/remote_repository/remote_user_profile_repository.dart';
import 'conversation_provider.dart';
import 'post_media_provider.dart';
import 'post_provider.dart';
import 'storage_provider.dart';
import 'user_presence_provider.dart';
import 'user_profile_provider.dart';

List<SingleChildWidget> getListRepositoryProvider() {
  return [
    ChangeNotifierProvider<UserProfileProvider>(
      create: (context) => UserProfileProvider(
        remoteUserProfileRepository: RemoteUserProfileRepository(),
      ),
    ),
    ChangeNotifierProvider<UserPresenceProvider>(
      create: (context) => UserPresenceProvider(
        remoteUserPresenceRepository: RemoteUserPresenceRepository(),
      ),
    ),
    ChangeNotifierProvider<StorageProvider>(
      create: (context) => StorageProvider(
        remoteStorageRepository: RemoteStorageRepository(),
      ),
    ),
    ChangeNotifierProvider<PostProvider>(
      create: (context) => PostProvider(
        remotePostRepository: RemotePostRepository(),
      ),
    ),
    ChangeNotifierProvider<PostMediaProvider>(
      create: (context) => PostMediaProvider(
        remotePostMediaRepository: RemotePostMediaRepository(),
      ),
    ),
    ChangeNotifierProvider<ConversationProvider>(
      create: (context) => ConversationProvider(
        remoteConversationRepository: RemoteConversationRepository(),
      ),
    ),
  ];
}
