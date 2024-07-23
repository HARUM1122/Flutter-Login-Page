import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_page/features/auth/data/repositories/auth_repository.dart';
import 'package:login_page/features/auth/domain/models/user_model.dart';
import 'package:login_page/features/auth/domain/providers/auth_provider.dart';


final authController = StateNotifierProvider<AuthController, User>((ref) {
  return AuthController(
    ref.read(authRepositoryProvider)
  );
});


class AuthController extends StateNotifier<User> {
  final AuthRepositoryImpl authRepositoryImpl;
  AuthController(this.authRepositoryImpl) : super(User(uid: '', username: ''));

  Future<bool> signInUser(String email, String password) async {
    final User? user = await authRepositoryImpl.signInUser(email, password);
    if (user == null) return false;
    state = user;
    return true;
  }

  Future<bool> signUpUser(String email, String password) async {
    final User? user = await authRepositoryImpl.signUpUser(email, password);
    if (user == null) return false;
    state = user;
    return true;
  }

  Future<bool> signInWithGoogle() async {
    final User? user = await authRepositoryImpl.signInWithGoogle();
    if (user == null) return false;
    state = user;
    return true;
  }
}