import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_ui_kit/services/UserProfileScreen/constants/follower_constants_field.dart';
import 'package:social_ui_kit/services/UserProfileScreen/constants/following_constants_field.dart';

class FirebaseFollow {
  final docPath = FirebaseFirestore.instance.collection('follow');

  Future<List<String>?> getAllFollowers({required String userID}) async {
    return await docPath.doc(userID).get().then((value) {
      if (value.exists &&
          value.data()?[followers_field] != null &&
          value.reference.path.isNotEmpty) {
        return List<String>.from(value.get(followers_field) as List);
      } else {
        return null;
      }
    });
  }

  Future<List<String>?> getAllFollowing({required String userID}) async {
    return await docPath.doc(userID).get().then((value) {
      if (value.exists &&
          value.data()?[following_field] != null &&
          value.reference.path.isNotEmpty) {
        return List<String>.from(value.get(following_field) as List);
      } else {
        return null;
      }
    });
  }
}
