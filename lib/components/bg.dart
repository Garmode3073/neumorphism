import 'package:flutter/material.dart';

class BackgroundDecor extends StatefulWidget {
  const BackgroundDecor({Key? key, this.child}) : super(key: key);
  final Widget? child;

  @override
  State<BackgroundDecor> createState() => _BackgroundDecorState();
}

class _BackgroundDecorState extends State<BackgroundDecor> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.blue.withOpacity(0.9),
          Colors.purple.withOpacity(0.9)
        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
      ),
      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.green.withOpacity(0.4),
              Colors.blue.withOpacity(0.4)
            ], begin: Alignment.topRight, end: Alignment.bottomLeft),
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
