import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Info Screen'),
      ),
      body: Center(
        child: Text(
          'Welcome to the Info Screen!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}