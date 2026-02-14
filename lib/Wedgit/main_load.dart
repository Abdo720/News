import 'package:flutter/material.dart';
import 'package:news/Core/Colors.dart';

class MainLoad extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(color: Theme.of(context).splashColor),
    );
  }
}
