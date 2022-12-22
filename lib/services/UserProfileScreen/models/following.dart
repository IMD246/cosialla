// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:social_ui_kit/services/LoginScreen/constrants/user_profile_field.dart';

// class Following {
//   final String id;
//   final String following;
//   Following({
//     required this.id,
//     required this.following,
//   });
//   factory Following.fromSnapshot(
//       {required DocumentSnapshot<Map<String, dynamic>> doc}) {
//     return Following(
//       id: doc.id,
//       following: doc.data()?[following_field].toString() != null
//           ? doc.get(following_field)
//           : 0,
//     );
//   }
// }
