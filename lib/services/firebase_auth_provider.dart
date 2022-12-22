import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


class FirebaseAuthProvider {
  final FirebaseAuth authUser = FirebaseAuth.instance;
  Future<void> logout() async {
    final user = currentUser;
    if (user != null) {
      await authUser.signOut();
    }
  }

  Future<User?> signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: <String>[
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    final GoogleSignInAuthentication? googleSignAuth =
        await googleSignInAccount?.authentication;
    final AuthCredential authCredential = GoogleAuthProvider.credential(
      accessToken: googleSignAuth!.accessToken,
      idToken: googleSignAuth.idToken,
    );
    await authUser.signInWithCredential(authCredential);
    final user = currentUser;
    return user;
  }

  User? get currentUser {
    final User? user = FirebaseAuth.instance.currentUser;
    return user != null ? user : null;
  }
}
