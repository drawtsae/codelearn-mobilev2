import 'package:boilerplate/constants/assets.dart';
import 'package:flutter/material.dart';

class OverralInfomation extends StatelessWidget {
  const OverralInfomation({
    Key? key,
  }) : super(key: key);

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
            decoration:
                BoxDecoration(color: Colors.amber, shape: BoxShape.circle),
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.only(top: 30),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100.0),
              child: Image.asset(
                Assets.carBackground,
                width: MediaQuery.of(context).size.width * 0.25,
                height: MediaQuery.of(context).size.width * 0.25,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.star,
                color: Colors.amber,
              ),
              Icon(
                Icons.star,
                color: Colors.amber,
              ),
              Icon(
                Icons.star,
                color: Colors.amber,
              )
            ],
          ),
          Text(
            "Nguyễn ĐÔng Hướng",
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
                  text: '127',
                  style: TextStyle(color: Colors.amber),
                )
              ],
            ),
          ),
          Row(
            children: [
              Expanded(flex: 2, child: Center(child: Text('SLIVER'))),
              Expanded(
                flex: 8,
                child: LinearProgressIndicator(
                  minHeight: 10,
                ),
              ),
              Expanded(flex: 2, child: Center(child: Text('GOLD'))),
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
                  title: Text("donghuong@gmail.com"),
                ),
                ListTile(
                  leading: Icon(Icons.phone_outlined),
                  title: Text("0326946745"),
                ),
                ListTile(
                  leading: Icon(Icons.bookmark_outline_sharp),
                  title: Text("this is bio "),
                ),
                ListTile(
                  leading: Icon(Icons.calendar_month_outlined),
                  title: Text("12-12-2022"),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
