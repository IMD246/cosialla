import 'package:flutter/foundation.dart';

import '../repositories/remote_repository/remote_post_media_repository.dart';

class PostMediaProvider extends ChangeNotifier {
  final RemotePostMediaRepository remotePostMediaRepository;

  PostMediaProvider({
    required this.remotePostMediaRepository,
  });
}
