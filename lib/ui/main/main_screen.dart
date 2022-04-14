import 'package:boilerplate/stores/language/language_store.dart';
import 'package:boilerplate/stores/theme/theme_store.dart';
import 'package:boilerplate/ui/home/home_view.dart';
import 'package:boilerplate/ui/main/widget/bottom_navigation/main_bottom_navigation.dart';
import 'package:boilerplate/ui/main/widget/main_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //stores:---------------------------------------------------------------------
  int _selectedIndex = 0;
  PageController pageController = PageController();
  //late ThemeStore _themeStore;
  //late LanguageStore _languageStore;

  void ontaped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    pageController.jumpToPage(index);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // initializing stores
    //_languageStore = Provider.of<LanguageStore>(context);
    //_themeStore = Provider.of<ThemeStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: PageView(
        controller: pageController,
        children: [
          HomeView(),
        ],
      ),
      bottomNavigationBar: MainBottomNavigation(
        selectedIndex: _selectedIndex,
        onItemSelected: ontaped,
      ),
    );
  }
}
