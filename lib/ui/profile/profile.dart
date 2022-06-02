import 'package:boilerplate/stores/user/user_store.dart';
import 'package:boilerplate/ui/profile/widget/about_us.dart';
import 'package:boilerplate/ui/profile/widget/authenticate_profile.dart';
import 'package:boilerplate/ui/profile/widget/non_authenticate_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _userStore = Provider.of<UserStore>(context);
    return Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Observer(
                builder: (context) {
                  return _userStore.isLoggedIn
                      ? AuthenticateProfile()
                      : NonAuthenticateProfile();
                },
              ),
              AboutUs(),
            ],
          ),
        ));
  }
}
