import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../components/custom_button.dart';
import '../controllers/auth_controller.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _showPassword = true;
  bool _loading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFFFFFFFF),
      child: SingleChildScrollView(
        padding: EdgeInsets.only(
          left: MediaQuery.paddingOf(context).left + 30,
          right: MediaQuery.paddingOf(context).right + 30,
          top: MediaQuery.paddingOf(context).top + 30,
          bottom: MediaQuery.paddingOf(context).bottom,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Create\nAccount',
              style: TextStyle(
                color: Color(0xFF000000),
                fontSize: 40,
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(height: 30),
            TextField(
              controller: _emailController,
              cursorColor: const Color(0xFF000000),
              style: const TextStyle(
                color: Color(0xFF000000),
                fontSize: 24,
                fontWeight: FontWeight.w400
              ),
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF9E9E9E)), // Change this color to your desired color
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF000000)), // Change this color to your desired color
                ),
                hintText: 'Email address',
                hintStyle: TextStyle(
                  color: Color(0xFF9E9E9E),
                  fontSize: 24,
                  fontWeight: FontWeight.w400
                )
              )
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _passwordController,
              cursorColor: const Color(0xFF000000),
              obscureText: !_showPassword,
              style: const TextStyle(
                color: Color(0xFF000000),
                fontSize: 24,
                fontWeight: FontWeight.w400
              ),
              decoration: InputDecoration(
                suffixIcon: GestureDetector(
                  onTap: () => setState(() => _showPassword = !_showPassword),
                  child: Icon(
                    _showPassword ? Icons.visibility_off : Icons.visibility,
                    color: const Color(0xFF9E9E9E),
                    size: 28,
                  )
                ),
                enabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF9E9E9E)), // Change this color to your desired color
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF000000)), // Change this color to your desired color
                ),
                hintText: 'Password',
                hintStyle: const TextStyle(
                  color: Color(0xFF9E9E9E),
                  fontSize: 24,
                  fontWeight: FontWeight.w400
                )
              )
            ),
            const SizedBox(height: 50),
            Align(
              alignment: Alignment.bottomCenter,
              child: CustomButton(
                width: 140,
                height: 60,
                onPressed: () async {
                  setState(() => _loading = true);
                  final String 
                  email = _emailController.text.trim(),
                  password = _passwordController.text.trim();
                  if (await ref.read(authController.notifier).signUpUser(email, password) && context.mounted) {
                    context.go('/home-screen');
                  } else if (context.mounted) {
                    setState(() => _loading = false);
                  }
                },
                backgroundColor: const Color(0xFF000000),
                onPressedColor: const Color(0xFF191919),
                child: Center(
                  child: !_loading ? const Text(
                    "Let's go",
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 26,
                      fontWeight: FontWeight.bold
                    ),
                  ) : const CircularProgressIndicator(color: Color(0xFFFFFFFF))
                ),
              ),
            ),
            const SizedBox(height: 40),
            const Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'Sign in with',
                style: TextStyle(
                  color: Color(0xFF000000),
                  fontSize: 18
                )
              )
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                    if (await ref.read(authController.notifier).signInWithGoogle() && context.mounted) {
                        context.go('/home-screen');
                      }
                    },
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFF000000), width: 2),
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.transparent
                      ),
                      child: const Center(
                        child: Text(
                          "G",
                          style: TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 50,
                            fontWeight: FontWeight.bold
                          )
                        )
                      )
                    ),
                  ),
                ),
                const SizedBox(width: 30),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: 80,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFF000000), width: 2),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.transparent
                    ),
                    child: const Center(
                      child: Text(
                        "f",
                        style: TextStyle(
                          color: Color(0xFF000000),
                          fontSize: 50,
                          fontWeight: FontWeight.bold
                        )
                      )
                    )
                  ),
                )
              ]
            ),
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                "Already have an account?",
                style: TextStyle(
                  color: Colors.black, 
                  fontSize: 18
                )
              )
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                onTap: () {
                  context.go('/signin-page');
                },
                child: const Text(
                  "Sign In",
                  style: TextStyle(
                    color: Colors.black, 
                    fontSize: 24,
                    decoration: TextDecoration.underline
                  )
                ),
              )
            )
          ]
        ),
      )
    );
  }
}