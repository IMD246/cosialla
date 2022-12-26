import '../../models/post_media.dart';

abstract class PostMediaRepository {
  Future<void> createPostMedia({
    required String postMediaId,
    required Map<String,dynamic> mapPostMedia
  });
  Future<List<PostMedia>?> getListPostMediaByPostId({
    required String postId,
  });
}
