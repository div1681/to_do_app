import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:to_do_app/utilities/auth_service.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
    with SingleTickerProviderStateMixin {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  String errorMessage = '';
  bool showError = false;

  late AnimationController _shakeController;
  late Animation<double> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _shakeController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _offsetAnimation = TweenSequence([
      TweenSequenceItem(tween: Tween(begin: 0.0, end: -10.0), weight: 1),
      TweenSequenceItem(tween: Tween(begin: -10.0, end: 10.0), weight: 2),
      TweenSequenceItem(tween: Tween(begin: 10.0, end: -10.0), weight: 2),
      TweenSequenceItem(tween: Tween(begin: -10.0, end: 10.0), weight: 2),
      TweenSequenceItem(tween: Tween(begin: 10.0, end: 0.0), weight: 1),
    ]).animate(_shakeController);
  }

  @override
  void dispose() {
    _shakeController.dispose();
    super.dispose();
  }

  void triggerError(String msg) {
    FocusScope.of(context).unfocus();
    setState(() {
      errorMessage = msg;
      showError = true;
    });
    _shakeController.forward(from: 0);
  }

  void signupuser() async {
    setState(() {
      showError = false;
    });

    if (confirmpasswordController.text != passwordController.text) {
      triggerError("Passwords don't match.");
      return;
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: SizedBox(
          width: 160,
          child: LinearProgressIndicator(
            backgroundColor: Colors.black,
            color: Colors.white,
            minHeight: 12,
          ),
        ),
      ),
    );

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      triggerError(e.message ?? "Registration failed.");
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textColor = theme.textTheme.bodyMedium?.color;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 48),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "TODO.",
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w900,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                "Make it official.",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: textColor,
                ),
              ),
              const SizedBox(height: 32),

              TextField(
                controller: emailController,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(labelText: "Email"),
              ),
              const SizedBox(height: 16),

              TextField(
                controller: passwordController,
                textInputAction: TextInputAction.next,
                obscureText: true,
                decoration: const InputDecoration(labelText: "Password"),
              ),
              const SizedBox(height: 16),

              TextField(
                controller: confirmpasswordController,
                textInputAction: TextInputAction.done,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Confirm Password",
                ),
              ),

              const SizedBox(height: 32),

              ElevatedButton(
                onPressed: signupuser,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 56),
                ),
                child: const Text("SIGN UP"),
              ),

              const SizedBox(height: 16),

              if (showError)
                AnimatedBuilder(
                  animation: _offsetAnimation,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(_offsetAnimation.value, 0),
                      child: Text(
                        errorMessage,
                        style: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w800,
                          fontSize: 14,
                        ),
                      ),
                    );
                  },
                ),

              const SizedBox(height: 20),

              Row(
                children: [
                  const Expanded(child: Divider(thickness: 1)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(
                      "OR CONTINUE WITH",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: textColor,
                      ),
                    ),
                  ),
                  const Expanded(child: Divider(thickness: 1)),
                ],
              ),
              const SizedBox(height: 24),

              Center(
                child: GestureDetector(
                  onTap: () => signInWithGoogle(),
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: textColor ?? Colors.grey,
                        width: 2,
                      ),
                    ),
                    child: Image.asset(
                      'assets/images/google_logo.png',
                      height: 32,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account? ",
                    style: TextStyle(color: textColor),
                  ),
                  GestureDetector(
                    onTap: () {
                      widget.onTap?.call();
                    },
                    child: const Text(
                      "Login now",
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
