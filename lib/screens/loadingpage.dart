import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noti/components/bg.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BackgroundDecor(
        child: Center(
          child: Text("Loading...",
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              )),
        ),
      ),
    );
  }
}
