import 'package:boilerplate/data/network/apis/user_api.dart';
import 'package:boilerplate/data/user_repository.dart';
import 'package:boilerplate/di/components/service_locator.dart';
import 'package:boilerplate/models/user/user_info.dart';
import 'package:boilerplate/ui/general_profile/widget/certificate_infomation.dart';
import 'package:boilerplate/ui/general_profile/widget/overral_infomation.dart';
import 'package:boilerplate/ui/general_profile/widget/user_activites.dart';
import 'package:boilerplate/ui/general_profile/widget/user_course_info.dart';
import 'package:boilerplate/ui/general_profile/widget/user_training_info.dart';
import 'package:boilerplate/widgets/empty_app_bar_widget.dart';
import 'package:boilerplate/widgets/progress_indicator_widget.dart';
import 'package:flutter/material.dart';

class GeneralProfileSceen extends StatefulWidget {
  final String? userId;

  const GeneralProfileSceen({Key? key, this.userId}) : super(key: key);

  GeneralProfileSceenState createState() => GeneralProfileSceenState();
}

class GeneralProfileSceenState extends State<GeneralProfileSceen> {
  bool _isFirstLoadRunning = true;
  UserInfo? _userInfo;

  late UserRepository _userRepository;

  @override
  void initState() {
    super.initState();
    _userRepository = UserRepository(getIt<UserApi>());
    firstLoad();
  }

  void firstLoad() async {
    var data = await _userRepository.getUserInformation(widget.userId);
    setState(() {
      _userInfo = data;
      _isFirstLoadRunning = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EmptyAppBar(),
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.grey.shade300,
      body: _isFirstLoadRunning == true
          ? CustomProgressIndicatorWidget()
          : SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  SizedBox(height: 80),
                  OverralInfomation(userInfo: _userInfo),
                  CertificatesInfo(
                    certificates: _userInfo?.certificates ?? [],
                  ),
                  UserCoursesInfo(
                    listCourse: _userInfo?.userCourses ?? [],
                  ),
                  UserTrainingInfo(
                    userTrainings: _userInfo?.userTrainings ??
                        UserTrainings(
                          contributes: 0,
                          completedDifficult: 0,
                          completedEasy: 0,
                          completedMedium: 0,
                        ),
                  ),
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
