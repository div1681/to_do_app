import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signinuser() async {
    print("Sign In tapped");
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    ;
  }

  void googlesignin() {
    print("Google Sign In tapped");
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
                "Welcome back!",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: textColor,
                ),
              ),

              const SizedBox(height: 32),

              TextField(
                controller: emailController,
                decoration: InputDecoration(labelText: "Email"),
              ),

              const SizedBox(height: 16),

              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: "Password"),
              ),

              const SizedBox(height: 32),

              ElevatedButton(
                onPressed: signinuser,
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 56),
                ),
                child: const Text("SIGN IN"),
              ),

              const SizedBox(height: 32),

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
                  onTap: googlesignin,
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

              const SizedBox(height: 40),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Not a member? ", style: TextStyle(color: textColor)),
                  GestureDetector(
                    onTap: () {
                      print("Navigate to register");
                    },
                    child: const Text(
                      "Register now",
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
