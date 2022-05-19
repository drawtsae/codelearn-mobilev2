import 'package:boilerplate/constants/assets.dart';
import 'package:boilerplate/constants/font_family.dart';
import 'package:boilerplate/ui/general_profile/widget/certificate_infomation.dart';
import 'package:boilerplate/ui/general_profile/widget/overral_infomation.dart';
import 'package:boilerplate/ui/general_profile/widget/user_activites.dart';
import 'package:boilerplate/ui/general_profile/widget/user_course_info.dart';
import 'package:boilerplate/ui/general_profile/widget/user_training_info.dart';
import 'package:boilerplate/widgets/empty_app_bar_widget.dart';
import 'package:flutter/material.dart';

class GeneralProfileSceen extends StatefulWidget {
  GeneralProfileSceenState createState() => GeneralProfileSceenState();
}

class GeneralProfileSceenState extends State<GeneralProfileSceen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EmptyAppBar(),
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.grey.shade300,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            SizedBox(height: 80),
            OverralInfomation(),
            CertificatesInfo(),
            UserCoursesInfo(),
            UserTrainingInfo(),
            UserActivity(
              dateActivities: [
                DateTime.now(),
                DateTime.now().subtract(Duration(days: 3))
              ],
            )
          ],
        ),
      ),
    );
  }
}
