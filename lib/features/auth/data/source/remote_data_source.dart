import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;

abstract class RemoteDataSource {
  Future<UserCredential?> signIn(String email, String password);
  Future<UserCredential?> signUp(String email, String password);
  Future<UserCredential?> googleSignIn();
  Future<UserCredential?> facebookSignIn();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final FirebaseAuth auth;
  RemoteDataSourceImpl({required this.auth});

  @override
  Future<UserCredential?> signIn(String email, String password) async {
    try {
      UserCredential credential = await auth.signInWithEmailAndPassword(email: email, password: password);
      return credential;
    } catch(e) {
      return null;
    }
  }
  @override
  Future<UserCredential?> signUp(String email, String password) async {
    try {
      UserCredential credential = await auth.createUserWithEmailAndPassword(email: email, password: password);
      return credential;
    } catch(e) {
      return null;
    }
  }
  @override
  Future<UserCredential?> googleSignIn() async {
    try {
      GoogleSignInAccount? account = await GoogleSignIn().signIn();
      final googleAuth = await account?.authentication;
      if(googleAuth?.accessToken != null && googleAuth?.idToken != null) {
        final credential = GoogleAuthProvider.credential(accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
        UserCredential userCredential = await auth.signInWithCredential(credential);
        return userCredential;
      }
      return null;
    } catch(e) {
      return null;
    }
  }
  @override
  Future<UserCredential?> facebookSignIn() async {
    // WILL DO THIS LATER
    return null;
  }
}