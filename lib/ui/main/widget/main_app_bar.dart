import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      title: Text("Hi, welcome to CodeEdu 🔥"),
      backgroundColor: Color(0xFFFCFCFC),
      elevation: 0,
      centerTitle: false,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 26,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.0);
}
