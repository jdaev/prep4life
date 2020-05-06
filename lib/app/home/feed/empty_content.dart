import 'package:flutter/material.dart';

class EmptyContent extends StatelessWidget {
  final String title;
  final String message;

  const EmptyContent({Key key, this.title, this.message}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
