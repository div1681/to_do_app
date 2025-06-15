import 'package:flutter/material.dart';
import 'package:to_do_app/pages/login_page.dart';
import 'package:to_do_app/pages/register_page.dart';

class LoginRegisterPage extends StatefulWidget {
  const LoginRegisterPage({super.key});

  @override
  State<LoginRegisterPage> createState() => _LoginRegisterPageState();
}

class _LoginRegisterPageState extends State<LoginRegisterPage> {
  bool showlogin = true;
  void toggle() {
    setState(() {
      showlogin = !showlogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showlogin) {
      return LoginPage(onTap: toggle);
    } else {
      return RegisterPage(onTap: toggle);
    }
  }
}
