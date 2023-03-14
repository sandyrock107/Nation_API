import 'package:flutter/material.dart';

class oneclick extends StatefulWidget {
  const oneclick({Key? key}) : super(key: key);

  @override
  State<oneclick> createState() => _oneclickState();
}

class _oneclickState extends State<oneclick> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100,
        width: 200,
        color: Colors.cyanAccent,
      ),
    );
  }
}
