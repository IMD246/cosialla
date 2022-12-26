import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/post.dart';
import '../constants/post_field_constants.dart';
import '../interface_repository/post_repository.dart';

class RemotePostRepository implements PostRepository {
  late CollectionReference firebasePostDoc;

  RemotePostRepository() {
    firebasePostDoc = FirebaseFirestore.instance.collection(
      PostFieldConstants.collectionName,
    );
  }

  @override
  Future<bool> createPost({
    String? postId,
    required Map<String, dynamic> mapPost,
  }) async {
    try {
      await firebasePostDoc.doc(postId).set(mapPost);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<Post?> getSpecifyPostLastestByUserID({
    required String userID,
  }) async {
    try {
      return await firebasePostDoc
          .where(PostFieldConstants.userIDField, isEqualTo: userID)
          .orderBy(PostFieldConstants.stampTimeField)
          .limit(1)
          .get()
          .then((value) {
        if (value.size == 0 || value.docs.isEmpty) {
          return null;
        }
        return _parsedObjectToUserProfile(
          value: value.docs.first.data(),
        );
      });
    } catch (e) {
      return null;
    }
  }

  Post _parsedObjectToUserProfile({required Object? value}) {
    final convertToMap = json.decode(
      json.encode(
        value,
      ),
    ) as Map<String, dynamic>;
    return Post.fromMap(convertToMap);
  }
}
