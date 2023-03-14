import 'package:flutter/material.dart';

class user extends StatefulWidget {
  //int userId, id;
  String title;

  //user(this.userId, this.id, this.title);
  user(this.title);

  @override
  State<user> createState() => _userState();
}

class _userState extends State<user> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
              child: Column(
            children: [
              //Text(widget.userId.toString()),
              // Text(widget.id.toString()),
              Text(widget.title),
            ],
          ))
        ],
      ),
    );
  }
}
