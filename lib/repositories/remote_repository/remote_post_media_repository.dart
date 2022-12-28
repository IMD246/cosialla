import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/post_media.dart';
import '../constants/post_media_field_constants.dart';
import '../interface_repository/post_media_repository.dart';

class RemotePostMediaRepository implements PostMediaRepository {
  late CollectionReference firebasePostMediaDoc;

  RemotePostMediaRepository() {
    firebasePostMediaDoc = FirebaseFirestore.instance.collection(
      PostMediaFieldConstants.collectionName,
    );
  }

  @override
  Future<void> createPostMedia({
    required String postMediaId,
    required Map<String, dynamic> mapPostMedia,
    required String postId,
  }) async {
    try {
      await firebasePostMediaDoc
          .doc(postId)
          .collection("media")
          .doc(postMediaId)
          .set(mapPostMedia);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Future<List<PostMedia>?> getListPostMediaByPostId({
    required String postId,
  }) async {
    try {
      return await firebasePostMediaDoc
          .where(PostMediaFieldConstants.postIDField, isEqualTo: postId)
          .orderBy(PostMediaFieldConstants.stampTimeField, descending: true)
          .get()
          .then((value) {
        if (value.size == 0 || value.docs.isEmpty) {
          return null;
        }
        final list = value.docs.map((e) {
          return _parsedObjectToPostMedia(value: e.data());
        });
        return list.toList();
      });
    } catch (e) {
      return null;
    }
  }

  PostMedia _parsedObjectToPostMedia({required Object? value}) {
    final convertToMap = json.decode(
      json.encode(
        value,
      ),
    ) as Map<String, dynamic>;
    return PostMedia.fromMap(convertToMap);
  }
}
