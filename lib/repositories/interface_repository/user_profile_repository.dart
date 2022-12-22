import 'package:firebase_auth/firebase_auth.dart';

import '../../models/user_profile.dart';

abstract class UserProfileRepository {
  Future<void> createUserProfile({required User? user});

  Future<UserProfile?> getUserProfileById({required String? userID});

  Stream<Iterable<UserProfile>?> getAllUserProfileBySearchText(
      {required String? searchText});

  Future<bool> updateUserProfile(
    Map<String, dynamic> mapUserProfile,
    String uid,
  );
}
