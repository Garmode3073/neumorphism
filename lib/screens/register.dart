import 'package:flutter/material.dart';
import 'package:noti/components/bg.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundDecor(
        child: ListView(),
      ),
    );
  }
}
