import '../models/user_model.dart';

abstract class AuthRepository {
  Future<User?> signInUser(String email, String password);
  Future<User?> signUpUser(String email, String password);
  Future<User?> signInWithGoogle();
  Future<User?> signInWithFacebook();
}