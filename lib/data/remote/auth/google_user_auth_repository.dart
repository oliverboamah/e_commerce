// third party imports
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

// my app imports
import 'package:e_commerce/domain/repositories/secondary_user_auth_repository.dart';

class GoogleUserAuthRepository extends SecondaryUserAuthRepository {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  Future<String> signIn() async {
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);

    final AuthResult authResult =
        await firebaseAuth.signInWithCredential(credential);
    final FirebaseUser user = authResult.user;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentuser = await firebaseAuth.currentUser();
    assert(user.uid == currentuser.uid);

    return 'signInWithGoogle succeeded: $user';
  }

  @override
  Future<void> signOut() async {
    await googleSignIn.signOut();
  }
}
