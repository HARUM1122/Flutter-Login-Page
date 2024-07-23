import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_page/features/auth/data/repositories/auth_repository.dart';
import 'package:login_page/features/auth/data/source/remote_data_source.dart';

final authRepositoryProvider = Provider((ref) {
  final RemoteDataSource dataSource = RemoteDataSourceImpl(auth: FirebaseAuth.instance);
  return AuthRepositoryImpl(remoteDataSource: dataSource);
});