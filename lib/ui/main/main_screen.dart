import 'package:boilerplate/ui/course/course.dart';
import 'package:boilerplate/ui/home/home.dart';
import 'package:boilerplate/ui/main/widget/bottom_navigation/main_bottom_navigation.dart';
import 'package:boilerplate/ui/main/widget/main_app_bar.dart';
import 'package:boilerplate/ui/post/post.dart';
import 'package:boilerplate/ui/profile/profile.dart';
import 'package:boilerplate/ui/training/training.dart';

import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //stores:---------------------------------------------------------------------
  int _selectedIndex = 0;
  PageController _pageController = PageController();

  void onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: PageView(
        controller: _pageController,
        children: [
          HomeView(pageController: _pageController),
          PostView(),
          CourseView(),
          TrainingView(),
          ProfileView(),
        ],
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: MainBottomNavigation(
        selectedIndex: _selectedIndex,
        onItemSelected: onPageChanged,
      ),
    );
  }
}
