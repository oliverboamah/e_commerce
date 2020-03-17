// third party imports
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';

// my app imports
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:e_commerce/domain/repositories/secondary_user_auth_repository.dart';

class FacebookUserAuthRepository extends SecondaryUserAuthRepository {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final FacebookLogin facebookLogin = FacebookLogin();

  @override
  Future<String> signIn() async {
    final FacebookLoginResult facebookLoginResult =
        await facebookLogin.logIn(['email']);

    switch (facebookLoginResult.status) {
      case FacebookLoginStatus.error:
        throw PlatformException(
            code: 'Facebook Login Error',
            message: facebookLoginResult.errorMessage);
        break;
      case FacebookLoginStatus.cancelledByUser:
        throw PlatformException(
            code: 'Facebook Login Canceled',
            message: 'Facebook Login session was canceled by user');
        break;
      default:
    }
    final AuthCredential credential = FacebookAuthProvider.getCredential(
        accessToken: facebookLoginResult.accessToken.token);

    final AuthResult authResult =
        await firebaseAuth.signInWithCredential(credential);

    final FirebaseUser user = authResult.user;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    final FirebaseUser currentuser = await firebaseAuth.currentUser();
    assert(user.uid == currentuser.uid);

    return 'signInWithFacebook succeeded: $user';
  }

  @override
  Future<void> signOut() async {
    await facebookLogin.logOut();
  }
}
