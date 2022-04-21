import 'package:boilerplate/ui/webview/webview.dart';
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
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => WebviewScreen(
                          url: "https://codelearn-trteam.netlify.app/about-us",
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text('Sharing'),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => WebviewScreen(
                          url: "https://codelearn-trteam.netlify.app/about-us",
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text('About Us'),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => WebviewScreen(
                          url: "https://codelearn-trteam.netlify.app/terms",
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text('Terms of Use'),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  'HELP',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => WebviewScreen(
                          url: "https://codelearn-trteam.netlify.app/about-us",
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text('Support'),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => WebviewScreen(
                          url: "https://codelearn-trteam.netlify.app/about-us",
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text('Discussion'),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => WebviewScreen(
                          url: "https://codelearn-trteam.netlify.app/about-us",
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text('Contact us'),
                  ),
                )
              ],
            ),
          ],
        ),
      ]),
    );
  }
}
