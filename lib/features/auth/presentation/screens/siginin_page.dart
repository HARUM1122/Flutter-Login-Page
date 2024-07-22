import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFFFFFFFF),
      child: Column(
        children: [
          const Text(
            'Create',
            style: TextStyle(
              color: Color(0xFF000000),
              fontSize: 20
            ),
          ),
          const Text(
            'Account',
            style: TextStyle(
              color: Color(0xFF000000),
              fontSize: 20
            ),
          )
        ],
      ),
    );
  }
}