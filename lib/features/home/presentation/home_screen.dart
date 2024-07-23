import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_page/features/auth/domain/models/user_model.dart';
import 'package:login_page/features/auth/presentation/controllers/auth_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Info"),
      ),
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            final User user = ref.watch(authController);
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "USERNAME: ${user.username}"
                ),
                const SizedBox(height: 10),
                Text(
                  "UID: ${user.uid}"
                )
              ],
            );
          }
        ),
      ),
    );
  }
}