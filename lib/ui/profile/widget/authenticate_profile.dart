import 'package:boilerplate/constants/assets.dart';
import 'package:boilerplate/constants/common.dart';
import 'package:boilerplate/models/user/user_info.dart';
import 'package:boilerplate/stores/user/user_store.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../profile_update/profile_update.screen.dart';

class AuthenticateProfile extends StatelessWidget {
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
                ClipRRect(
                  borderRadius: BorderRadius.circular(100.0),
                  child: Image.network(
                    userInfo?.profilePicture ?? DEFAULT_AVATAR,
                    width: 35,
                    height: 35,
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: RichText(
                    text: TextSpan(
                      text: '${userInfo?.firstName} ${userInfo?.lastName}',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        TextSpan(
                          text: '\n',
                        ),
                        TextSpan(
                            text: userInfo?.email,
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
                  child: LinearProgressIndicator(
                    minHeight: 10,
                    value: (userInfo?.userLevel?.percent ?? 0) / 100,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: '${userInfo?.userLevel?.percent} %',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        TextSpan(
                          text: '\n',
                        ),
                        TextSpan(
                          text: userInfo?.userLevel?.next,
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
                  LinearProgressIndicator(
                    value: 0.3,
                    minHeight: 10,
                  )
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
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ProfileUpdateScreen(),
            ),
          ),
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
