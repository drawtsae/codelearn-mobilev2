import 'package:boilerplate/constants/assets.dart';
import 'package:flutter/material.dart';

class AuthenticateProfile extends StatelessWidget {
  Widget _topAccountSummry() {
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
                  child: Image.asset(
                    Assets.carBackground,
                    width: 35,
                    height: 35,
                    fit: BoxFit.fill,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: RichText(
                    text: TextSpan(
                      text: 'Nguyễn Đông Hướng ',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      children: const <TextSpan>[
                        TextSpan(
                          text: '\n',
                        ),
                        TextSpan(
                            text: 'hdit@gmail.com',
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
                    value: 0.8,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: '4 %',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                      children: const <TextSpan>[
                        TextSpan(
                          text: '\n',
                        ),
                        TextSpan(
                          text: 'GOLD',
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

  Widget _botAccountSumary() {
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
                      children: const <TextSpan>[
                        TextSpan(
                          text: '\n\n',
                        ),
                        TextSpan(
                          text: '1/3 ',
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
                  children: const <TextSpan>[
                    TextSpan(
                      text: '\n\n',
                    ),
                    TextSpan(
                      text: '5/42 ',
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

  Widget _accountNavigations() {
    return Container(
      child: Column(children: [
        SizedBox(height: 20),
        Divider(thickness: 1),
        ListTile(
          title: Text('Profile'),
          leading: Icon(Icons.account_circle_outlined),
          trailing: Icon(Icons.navigate_next),
          onTap: () {},
        ),
        Divider(thickness: 1),
        ListTile(
          title: Text('Change Password'),
          leading: Icon(Icons.key),
          trailing: Icon(Icons.navigate_next),
          onTap: () {},
        ),
        Divider(thickness: 1),
        ListTile(
          title: Text('Logout'),
          leading: Icon(Icons.logout),
          trailing: Icon(Icons.navigate_next),
          onTap: () {},
        ),
        Divider(thickness: 1),
        SizedBox(height: 20)
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            "Welcome to Codelearn. Let's get started!",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          _topAccountSummry(),
          _botAccountSumary(),
          _accountNavigations()
        ],
      ),
    );
  }
}
