import 'package:boilerplate/constants/assets.dart';
import 'package:boilerplate/constants/common.dart';
import 'package:boilerplate/models/user/user_info.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/getwidget.dart';

class OverralInfomation extends StatelessWidget {
  final UserInfo? userInfo;

  const OverralInfomation({Key? key, this.userInfo}) : super(key: key);

  double calPercent(num? number) {
    if (number != null)
      return number / 100;
    else
      return 0;
  }

  Color getColorByLevel(String? currentLevel) {
    if (currentLevel == "BRONZE")
      return Colors.brown.shade300;
    else if (currentLevel == "SLIVER")
      return Colors.grey;
    else
      return Colors.amber;
  }

  int getNumStarByLevel(String? currentLevel) {
    if (currentLevel == "BRONZE")
      return 1;
    else if (currentLevel == "SLIVER")
      return 2;
    else
      return 3;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: getColorByLevel(userInfo?.userLevel?.current),
                shape: BoxShape.circle),
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.only(top: 30),
            child: GFAvatar(
              size: GFSize.LARGE,
              backgroundImage: NetworkImage(
                  userInfo?.profilePicture ?? 'https://i.ibb.co/4Vsxhz0/2.png'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              getNumStarByLevel(userInfo?.userLevel?.current),
              (index) => Icon(
                Icons.star,
                color: getColorByLevel(userInfo?.userLevel?.current),
              ),
            ),
          ),
          Text(
            "${userInfo?.firstName} ${userInfo?.lastName}",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          RichText(
            text: TextSpan(
              text: 'EXP: ',
              style: TextStyle(
                color: Colors.black,
              ),
              children: [
                TextSpan(
                  text: userInfo?.exp.toString(),
                  style: TextStyle(color: Colors.amber),
                )
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                  flex: 2,
                  child:
                      Center(child: Text(userInfo?.userLevel?.current ?? ""))),
              Expanded(
                flex: 8,
                child: GFProgressBar(
                    percentage: (userInfo!.userLevel!.percent ?? 0) / 100,
                    backgroundColor: Colors.black26,
                    lineHeight: 20,
                    progressBarColor: GFColors.WARNING),
              ),
              Expanded(
                  flex: 2,
                  child: Center(child: Text(userInfo?.userLevel?.next ?? ""))),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
            child: Divider(
              height: 20,
              color: Colors.grey,
            ),
          ),
          Container(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "INFOMATION",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.mail_outline),
                  title: Text(userInfo?.email ?? ""),
                ),
                ListTile(
                  leading: Icon(Icons.supervised_user_circle_rounded),
                  title: Text(userInfo?.gender ?? ""),
                ),
                ListTile(
                  leading: Icon(Icons.phone_outlined),
                  title: Text(userInfo?.phoneNumber ?? ""),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
