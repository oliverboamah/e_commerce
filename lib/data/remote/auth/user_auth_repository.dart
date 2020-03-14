import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:e_commerce/domain/repositories/user_auth_repository.dart';

class FirebaseUserAuthRepository extends UserAuthRepository {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final Firestore database = Firestore.instance;

  @override
  Future<String> signIn({String email, String password}) async {
    AuthResult authResult = await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser user = authResult.user;
    return user.uid;
  }

  @override
  Future<String> signUp(
      String email, String password, String firstName, String lastName) async {
    print('email: ' + email);
    // create user
    AuthResult authResult = await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    FirebaseUser user = authResult.user;

    // save corresponding user profile data
    final userProfile = {
      'user_id': user.uid,
      'first_name': firstName,
      'last_name': lastName
    };
    await database.collection('user_profiles').add(userProfile);

    return user.uid;
  }
}
