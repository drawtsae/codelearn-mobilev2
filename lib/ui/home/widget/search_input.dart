import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: TextField(
        decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'What do you want to find...',
            suffixIcon: IconButton(
              onPressed: () => null,
              icon: Icon(Icons.search),
            )),
      ),
    );
  }
}
