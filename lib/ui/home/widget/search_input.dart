import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: Colors.black,
                width: 2,
              ),
            ),
            margin: EdgeInsets.all(25),
            child: TextField(
              cursorColor: Colors.black,
              decoration: InputDecoration(
                  fillColor: Colors.amber.withOpacity(0.1),
                  filled: true,
                  contentPadding: EdgeInsets.all(18),
                  border: InputBorder.none,
                  hintText: 'Search for history, classes,...',
                  hintStyle: TextStyle(color: Colors.greenAccent)),
            ),
          ),
          Positioned(
            right: 45,
            top: 35,
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.asset(
                'assets/icons/ic_search.png',
                width: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}
