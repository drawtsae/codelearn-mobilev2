import 'package:boilerplate/utils/routes/routes.dart';
import 'package:flutter/material.dart';

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
          Text(
              'Please login or register TRTEAM account to enjoy your Journeys'),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 40,
                  width: 100,
                  child: TextButton(
                    style: ButtonStyle(
                      side: MaterialStateProperty.resolveWith<BorderSide>(
                          (states) => BorderSide(color: Colors.orange)),
                    ),
                    onPressed: () {
                      Future.delayed(Duration(milliseconds: 0), () {
                        Navigator.of(context).pushNamed(Routes.login);
                      });
                    },
                    child: Text('Login'),
                  ),
                ),
                SizedBox(
                  height: 40,
                  width: 100,
                  child: TextButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.orange)),
                    onPressed: () {
                      Future.delayed(Duration(milliseconds: 0), () {
                        Navigator.of(context).pushNamed(Routes.register);
                      });
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
