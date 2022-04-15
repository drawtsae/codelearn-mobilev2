import 'package:boilerplate/ui/profile/widget/about_us.dart';
import 'package:boilerplate/ui/profile/widget/authenticate_profile.dart';
import 'package:boilerplate/ui/profile/widget/non_authenticate_profile.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              AuthenticateProfile(),
              // NonAuthenticateProfile(),
              AboutUs(),
            ],
          ),
        ));
  }
}
