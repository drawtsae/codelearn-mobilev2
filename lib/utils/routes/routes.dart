import 'package:boilerplate/ui/change_password/change_password.dart';
import 'package:boilerplate/ui/learning_journey/learning_journey.dart';
import 'package:boilerplate/ui/login/login.dart';
import 'package:boilerplate/ui/mail_confirm/mail_confirm.dart';
import 'package:boilerplate/ui/main/main_screen.dart';
import 'package:boilerplate/ui/register/register.dart';
import 'package:boilerplate/ui/splash/splash.dart';
import 'package:flutter/material.dart';

class Routes {
  Routes._();

  //static variables
  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';
  static const String register = '/register';
  static const String forgotpassword = '/forgotpassword';
  static const String confirmmail = '/confirmmail';
  static const String changePassword = "/changePassword";
  static const String learningjourney = "/learningjourney";

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => SplashScreen(),
    login: (BuildContext context) => LoginScreen(),
    home: (BuildContext context) => MainScreen(),
    register: (BuildContext context) => RegisterScreen(),
    confirmmail: (BuildContext context) => MailConfirmScreen(),
    changePassword: (BuildContext context) => ChangePasswordScreen(),
    learningjourney: (BuildContext context) => LearningJourneyScreen()
  };
}
