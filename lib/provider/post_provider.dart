import 'package:flutter/foundation.dart';

import '../repositories/remote_repository/remote_post_repository.dart';

class PostProvider extends ChangeNotifier {
  final RemotePostRepository remotePostRepository;

  PostProvider({
    required this.remotePostRepository,
  });
}
