import 'package:flutter/material.dart';
import 'package:noti/globals.dart' as g;
import 'package:noti/screens/loadingpage.dart';
import 'package:noti/models/userinapp.dart';
import 'package:noti/screens/login.dart';
import 'package:noti/screens/register.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserinApp>(context);
    if (mounted) {
      setState(() {
        g.user = user;
      });
    }

    if (g.user!.uid == "0") {
      return LoginScreen();
    }
    return LoadingPage();
  }
}
