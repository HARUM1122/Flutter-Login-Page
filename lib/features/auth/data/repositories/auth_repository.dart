import 'package:firebase_auth/firebase_auth.dart' hide User;


import '../source/remote_data_source.dart';
import '../../domain/models/user_model.dart';
import '../../domain/repositories/auth_repository.dart';


class AuthRepositoryImpl implements AuthRepository {
  final RemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<User?> signInUser(String email, String password) async {
    final UserCredential? credential = await remoteDataSource.signIn(email, password);
    if (credential == null) return null;
    return User(
      uid: credential.user?.uid ?? 'NO UID',
      username: credential.additionalUserInfo?.username ?? 'NO USERNAME PROVIDED'
    );
  }

  @override
  Future<User?> signUpUser(String email, String password) async {
    final UserCredential? credential = await remoteDataSource.signUp(email, password);
    if (credential == null) return null;
    return User(
      uid: credential.user?.uid ?? 'NO UID',
      username: credential.additionalUserInfo?.username ?? 'NO USERNAME PROVIDED'
    );
  }

  @override
  Future<User?> signInWithGoogle() async {
    final UserCredential? credential = await remoteDataSource.googleSignIn();
    if (credential == null) return null;
    return User(
      uid: credential.user?.uid ?? 'NO UID',
      username: credential.additionalUserInfo?.username ?? 'NO USERNAME PROVIDED'
    );
  }

  @override
  Future<User?> signInWithFacebook() async {
    return null;
  }
}