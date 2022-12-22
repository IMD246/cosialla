import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../models/user_profile.dart';
import '../constants/user_profile_field_constants.dart';
import '../interface_repository/user_profile_repository.dart';

class RemoteUserProfileRepository implements UserProfileRepository {
  late CollectionReference firebaseUserProfileDoc;
  RemoteUserProfileRepository() {
    firebaseUserProfileDoc =
        FirebaseFirestore.instance.collection('userProfile');
  }
  @override
  Future<void> createUserProfile({required User? user}) async {
    if (user?.uid != null) {
      try {
        Map<String, dynamic> mapUserProfile = {
          UserProfileFieldConstants.idUserField: user?.uid,
          UserProfileFieldConstants.emailField: user?.email,
          UserProfileFieldConstants.fullNameField: user?.displayName,
          UserProfileFieldConstants.isEmailVerifiedField: user?.emailVerified,
          UserProfileFieldConstants.userMessagingTokenField: ""
        };
        await firebaseUserProfileDoc.doc(user?.uid).set(mapUserProfile);
      } catch (_) {}
    } else {}
  }

  @override
  Stream<Iterable<UserProfile>?> getAllUserProfileBySearchText(
      {required String? searchText}) {
    return Stream.empty();
    // if (searchText?.isEmpty == true) {
    //   final listUserProfile = firebaseUserProfileDoc.limit(20).snapshots().map(
    //     (event) {
    //       if (event.docs.isNotEmpty) {
    //         return event.docs.map(
    //           (e) {
    //             return UserProfile.fromSnapshot(doc: e);
    //           },
    //         );
    //       } else {
    //         return null;
    //       }
    //     },
    //   );
    //   return listUserProfile;
    // } else {
    //   final String text = searchText! + "\uf8ff";
    //   final listUserProfile = firebaseUserProfileDoc
    //       .where(UserProfileFieldConstants.fullNameField, isGreaterThanOrEqualTo: searchText)
    //       .where(UserProfileFieldConstants.fullNameField, isLessThanOrEqualTo: text)
    //       .orderBy(UserProfileFieldConstants.fullNameField, descending: true)
    //       .limit(20)
    //       .snapshots()
    //       .map(
    //     (event) {
    //       if (event.docs.isNotEmpty) {
    //         return event.docs.map(
    //           (e) {
    //             return UserProfile.fromSnapshot(doc: e.);
    //           },
    //         );
    //       } else {
    //         return null;
    //       }
    //     },
    //   );
    //   return listUserProfile;
    // }
  }

  @override
  Future<UserProfile?> getUserProfileById({required String? userID}) async {
    if (userID != null) {
      try {
        return await firebaseUserProfileDoc.doc(userID).get().then(
          (value) async {
            if (value.exists && value.id.isNotEmpty) {
              return _parsedToUserProfile(value: value.data());
            }
            return null;
          },
        );
      } catch (_) {
        return null;
        // throw FailedQueryData();
      }
    } else {
      // throw UserNotLoggedInAuthException();
      return null;
    }
  }

  Future<bool> updateUserProfile(
    Map<String, dynamic> mapUserProfile,
    String uid,
  ) async {
    try {
      await firebaseUserProfileDoc.doc(uid).update(mapUserProfile);
      return true;
    } catch (e) {
      return false;
    }
  }

  UserProfile _parsedToUserProfile({required Object? value}) {
    final convertToMap = json.decode(
      json.encode(
        value,
      ),
    ) as Map<String, dynamic>;
    return UserProfile.fromMap(convertToMap);
  }
}
