import 'package:boilerplate/utils/routes/routes.dart';
import 'package:boilerplate/widgets/empty_app_bar_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MailConfirmScreen extends StatefulWidget {
  @override
  _MailConfirmScreenState createState() => _MailConfirmScreenState();
}

class _MailConfirmScreenState extends State<MailConfirmScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      primary: true,
      appBar: EmptyAppBar(),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 150,
                width: 150,
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/icons/email.png',
                      fit: BoxFit.fill,
                      height: 150,
                      width: 150,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Image.asset(
                        'assets/icons/approval.png',
                        fit: BoxFit.fill,
                        height: 50,
                        width: 50,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Register Success',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    style: TextStyle(fontSize: 17, color: Colors.black),
                    children: [
                      TextSpan(
                          text: "Congratulations, you have successfully\n"),
                      TextSpan(
                          text:
                              "registered your account. Please confirm your email\n"),
                      TextSpan(text: " with the link we sent."),
                    ]),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Future.delayed(Duration(milliseconds: 0), () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        Routes.login, (Route<dynamic> route) => false);
                  });
                },
                child: Text('Back to login'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
