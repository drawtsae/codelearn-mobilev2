import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Text(
          'CODELEARN TRTEAM',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
            'Codelearn Trteam is an online platform that helps users to learn, practice coding skills and join the online coding contests.'),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(
                  'INFORMATION',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 20),
                Text('Sharing'),
                SizedBox(height: 10),
                Text('About Us'),
                SizedBox(height: 10),
                Text('Terms of Use'),
              ],
            ),
            Column(
              children: [
                Text(
                  'HELP',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 20),
                Text('Support'),
                SizedBox(height: 10),
                Text('Discussion'),
                SizedBox(height: 10),
                Text('Contact us'),
              ],
            ),
          ],
        ),
      ]),
    );
  }
}
