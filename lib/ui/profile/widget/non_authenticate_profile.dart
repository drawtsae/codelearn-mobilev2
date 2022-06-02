import 'package:boilerplate/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class NonAuthenticateProfile extends StatelessWidget {
  const NonAuthenticateProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: Column(
        children: [
          Text('Login or be a member in TRTeam to join your journeys'),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GFButton(
                  size: GFSize.LARGE,
                  color: GFColors.WARNING,
                  onPressed: () {
                    Future.delayed(Duration(milliseconds: 0), () {
                      Navigator.of(context).pushNamed(Routes.login);
                    });
                  },
                  type: GFButtonType.outline2x,
                  text: "Login",
                  icon: Icon(Icons.login),
                ),
                GFButton(
                  size: GFSize.LARGE,
                  color: GFColors.WARNING,
                  onPressed: () {
                    Future.delayed(Duration(milliseconds: 0), () {
                      Navigator.of(context).pushNamed(Routes.register);
                    });
                  },
                  text: "Register",
                  icon: Icon(Icons.supervised_user_circle),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
