import 'package:flutter/material.dart';

class SearchInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.all(25),
            child: TextField(
              cursorColor: Colors.black,
              decoration: InputDecoration(
                  fillColor: Color.fromARGB(83, 255, 193, 7),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  contentPadding: EdgeInsets.all(18),
                  hintText: 'Search for history, classes,...',
                  hintStyle: TextStyle(color: Colors.black)),
            ),
          ),
          Positioned(
            right: 45,
            top: 35,
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(),
              child: Image.asset(
                'assets/icons/search.png',
                width: 20,
              ),
            ),
          )
        ],
      ),
    );
  }
}
