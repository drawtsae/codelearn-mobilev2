import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadMoreSpinner extends StatelessWidget {
  const LoadMoreSpinner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 40),
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
