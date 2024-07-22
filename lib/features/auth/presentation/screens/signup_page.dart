import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _showPassword = true;

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
      child: Padding(
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
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)
                  ),
                  backgroundColor: const Color(0xFF000000)
                ),
                onPressed: () {},
                child: const Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    "Let's go",
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 26,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              )
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
                Container(
                  width: 100,
                  height: 80,
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFF000000), width: 2),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.transparent
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.apple,
                      color: Color(0xFF000000),
                      size: 60,
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  width: 100,
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
                const Spacer(),
                Container(
                  width: 100,
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
                )
              ]
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.bottomCenter,
              child: RichText(
                    text: TextSpan(
                      text: 'Already have an account? ',
                      style: const TextStyle(color: Colors.black, fontSize: 18),
                      children: [
                        TextSpan(
                          text: 'Log in',
                          style: const TextStyle(
                            color: Color(0xFF000000),
                            fontSize: 18,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                            },
                        ),
                      ],
                    ),
                  ),
            )
          ]
        )
      )
    );
  }
}