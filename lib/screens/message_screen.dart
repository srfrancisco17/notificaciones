// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';


class MessageScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Message'),
      ),
      body: Center(
        child: Text('Message Screen'),
     ),
   );
  }
}