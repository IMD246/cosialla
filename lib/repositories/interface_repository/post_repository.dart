import '../../models/post.dart';

abstract class PostRepository {
  Future<bool> createPost({
    required String? postId,
    required Map<String, dynamic> mapPost,
  });
  Future<Post?> getSpecifyPostLastestByUserID({
    required String userID,
  });
}
