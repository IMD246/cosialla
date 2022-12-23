import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../repositories/remote_repository/remote_storage_repository.dart';
import '../repositories/remote_repository/remote_user_presence_repository.dart';
import '../repositories/remote_repository/remote_user_profile_repository.dart';
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
  ];
}
