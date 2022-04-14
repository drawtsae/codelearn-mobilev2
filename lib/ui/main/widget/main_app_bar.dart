import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      title: Text('Hi, there'),
      actions: _buildActions(context),
      backgroundColor: Color(0xFFFCFCFC),
      elevation: 0,
      centerTitle: false,
      titleTextStyle: TextStyle(
        color: Colors.amberAccent,
        fontSize: 16,
      ),
    );
  }

  List<Widget> _buildActions(BuildContext context) {
    return <Widget>[
      Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10, right: 20),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(
                color: Color.fromARGB(178, 3, 3, 3).withOpacity(0.3),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Image.asset(
              'assets/icons/notification.png',
              width: 30,
            ),
          ),
          Positioned(
            top: 15,
            right: 30,
            child: Container(
              height: 8,
              width: 8,
              decoration: BoxDecoration(
                color: Color.fromARGB(177, 172, 8, 8),
                shape: BoxShape.circle,
              ),
            ),
          )
        ],
      )
    ];
  }

  @override
  Size get preferredSize => Size.fromHeight(60.0);
}
