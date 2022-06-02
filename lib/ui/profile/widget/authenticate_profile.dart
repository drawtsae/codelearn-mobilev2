import 'package:boilerplate/models/user/user_info.dart';
import 'package:boilerplate/stores/user/user_store.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:provider/provider.dart';

import '../../profile_update/profile_update.screen.dart';

class AuthenticateProfile extends StatefulWidget {
  @override
  State<AuthenticateProfile> createState() => _AuthenticateProfileState();
}

class _AuthenticateProfileState extends State<AuthenticateProfile> {
  late UserStore _userStore;

  Widget _topAccountSummry(UserInfo? userInfo) {
    return Container(
      width: Size.infinite.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color.fromARGB(255, 255, 241, 200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                GFAvatar(
                  backgroundImage: NetworkImage(userInfo!.profilePicture ??
                      'https://i.ibb.co/4Vsxhz0/2.png'),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: RichText(
                    text: TextSpan(
                      text: '${userInfo.firstName} ${userInfo.lastName}',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        TextSpan(
                          text: '\n',
                        ),
                        TextSpan(
                            text: userInfo.email,
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                            )),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 8,
                  child: GFProgressBar(
                      percentage: (userInfo.userLevel?.percent ?? 0) / 100,
                      backgroundColor: Colors.black26,
                      lineHeight: 20,
                      // child: const Text(
                      //   '${userInfo.userLevel?.percent} %',
                      //   textAlign: TextAlign.end,
                      //   style: TextStyle(fontSize: 16, color: Colors.white),
                      // ),
                      progressBarColor: GFColors.WARNING),
                ),
                Expanded(
                  flex: 2,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: '${userInfo.userLevel?.percent} %',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        TextSpan(
                          text: '\n',
                        ),
                        TextSpan(
                          text: userInfo.userLevel?.next,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _botAccountSumary(UserInfo? userInfo) {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 10, right: 5),
            child: Container(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Course: ',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        TextSpan(
                          text: '\n\n',
                        ),
                        TextSpan(
                          text: '${userInfo?.courseProcess} ',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                          ),
                        ),
                        TextSpan(
                          text: 'Finished ',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  GFProgressBar(
                      percentage: 4 / 5,
                      backgroundColor: Colors.black26,
                      lineHeight: 10,
                      progressBarColor: GFColors.WARNING)
                ],
              ),
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color.fromARGB(255, 255, 241, 200),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 10, left: 5),
            child: Container(
              padding: EdgeInsets.all(12),
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color.fromARGB(255, 255, 241, 200),
              ),
              child: RichText(
                text: TextSpan(
                  text: 'Rank: ',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  children: <TextSpan>[
                    TextSpan(
                      text: '\n\n',
                    ),
                    TextSpan(
                      text: '${userInfo?.userLevel?.rank} ',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                      ),
                    ),
                    TextSpan(
                      text: 'Users ',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _accountNavigations(BuildContext context) {
    return Container(
      child: Column(children: [
        SizedBox(height: 20),
        Divider(thickness: 1),
        ListTile(
          title: Text('Update Profile'),
          leading: Icon(Icons.account_circle_outlined),
          trailing: Icon(Icons.navigate_next),
          onTap: () => Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (context) => ProfileUpdateScreen(),
                ),
              )
              .then((value) => setState(() {})),
        ),
        Divider(thickness: 1),
        ListTile(
          title: Text('Learning Journey'),
          leading: Icon(Icons.import_contacts),
          trailing: Icon(Icons.navigate_next),
          onTap: () => Navigator.pushNamed(context, Routes.learningjourney),
        ),
        Divider(thickness: 1),
        ListTile(
          title: Text('Change Password'),
          leading: Icon(Icons.key),
          trailing: Icon(Icons.navigate_next),
          onTap: () => Navigator.pushNamed(context, Routes.changePassword),
        ),
        Divider(thickness: 1),
        ListTile(
          title: Text('Logout'),
          leading: Icon(Icons.logout),
          trailing: Icon(Icons.navigate_next),
          onTap: () {
            _userStore.logout();
          },
        ),
        Divider(thickness: 1),
        SizedBox(height: 20)
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    _userStore = Provider.of<UserStore>(context);

    return Container(
      child: Column(
        children: [
          FutureBuilder<UserInfo?>(
              future: _userStore.getCurrentUserInfo(),
              builder: (context, AsyncSnapshot<UserInfo?> snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    child: Column(children: [
                      _topAccountSummry(snapshot.data),
                      _botAccountSumary(snapshot.data),
                    ]),
                  );
                } else {
                  return CircularProgressIndicator();
                }
              }),
          _accountNavigations(context)
        ],
      ),
    );
  }
}
