import 'package:boilerplate/ui/main/widget/bottom_navigation/custom_animated_bottom_bar.dart';
import 'package:flutter/material.dart';

class MainBottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemSelected;

  const MainBottomNavigation(
      {Key? key, required this.selectedIndex, required this.onItemSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomAnimatedBottomBar(
      containerHeight: 70,
      backgroundColor: Colors.white,
      selectedIndex: selectedIndex,
      showElevation: true,
      itemCornerRadius: 24,
      curve: Curves.easeIn,
      onItemSelected: onItemSelected,
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
          icon: Icon(Icons.apps),
          title: Text('Home'),
          activeColor: Colors.amber,
          inactiveColor: Colors.grey,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.article),
          title: Text('Post'),
          activeColor: Colors.amber,
          inactiveColor: Colors.grey,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.integration_instructions),
          title: Text('Course'),
          activeColor: Colors.amber,
          inactiveColor: Colors.grey,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.rocket_launch),
          title: Text(
            'Training',
          ),
          activeColor: Colors.amber,
          inactiveColor: Colors.grey,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: Icon(Icons.account_circle),
          title: Text('Profile'),
          activeColor: Colors.amber,
          inactiveColor: Colors.grey,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
