import 'package:boilerplate/constants/url.dart';
import 'package:boilerplate/data/course_repository.dart';
import 'package:boilerplate/data/network/apis/course_api.dart';
import 'package:boilerplate/data/network/constants/endpoints.dart';
import 'package:boilerplate/data/sharedpref/shared_preference_helper.dart';
import 'package:boilerplate/di/components/service_locator.dart';
import 'package:boilerplate/models/course/course.dart';
import 'package:boilerplate/models/lesson/lesson.dart';
import 'package:boilerplate/ui/course_detail/widget/course_detail_summary.dart';
import 'package:boilerplate/ui/webview/webview.dart';
import 'package:boilerplate/utils/routes/routes.dart';

import 'package:boilerplate/widgets/progress_indicator_widget.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CourseDetailScreen extends StatefulWidget {
  final String id;

  const CourseDetailScreen({Key? key, required this.id}) : super(key: key);
  _CourseDetailScreenState createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
  late CourseRepository _courseRepository;
  late SharedPreferenceHelper _sharedPreferenceHelper;
  // Used to display loading indicators when _firstLoad function is running
  bool _isFirstLoadRunning = false;
  bool _isLogin = false;
  bool _enrolled = false;
  bool _isComplete = false;

  // This holds the posts fetched from the server
  Course? _course;

  Future<bool> _handleEnrollCourse() async {
    try {
      final result = await _courseRepository.enrollCourse(widget.id);
      setState(() {
        _enrolled = result;
      });
      if (result) {
        CoolAlert.show(
          context: context,
          type: CoolAlertType.success,
          text: "Register this Course success",
        );
      }

      return result;
    } catch (e) {
      CoolAlert.show(
        context: context,
        type: CoolAlertType.error,
        text: "Register this Course fail",
      );
      return false;
    }
  }

  void _firstLoad() async {
    setState(() {
      _isFirstLoadRunning = true;
    });
    try {
      var courseData = await _courseRepository.getCourseById(widget.id);
      var loginStatus = await _sharedPreferenceHelper.isLoggedIn;
      setState(() {
        _course = courseData;
        _isLogin = loginStatus;
        _enrolled = courseData.enrolled ?? false;
        _isComplete = courseData.isComplete ?? false;
      });
    } catch (err) {
      print('Something went wrong');
    }

    setState(() {
      _isFirstLoadRunning = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _courseRepository = CourseRepository(getIt<CourseApi>());
    _sharedPreferenceHelper =
        SharedPreferenceHelper(getIt<SharedPreferences>());
    _firstLoad();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        // backgroundColor: Color(0x44000000),
        leading: Padding(
          padding: const EdgeInsets.only(
            left: 10,
            top: 10,
          ),
          child: IconButton(
            icon: Icon(Icons.arrow_back_ios_outlined),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
      ),
      body: _isFirstLoadRunning
          ? CustomProgressIndicatorWidget()
          : SingleChildScrollView(
              child: Column(
                children: [
                  _buildTopbarCourseDetail(),
                  //----------
                  CourseDetailSummary(course: _course!),
                  _buildLessonList()
                ],
              ),
            ),
    );
  }

  void _handleWebviewResult(Lesson lesson) async {
    if (_isLogin == false) {
      Navigator.of(context).pushNamed(Routes.login);
    } else {
      if (lesson.isComplete == true) {
        CoolAlert.show(
          context: context,
          type: CoolAlertType.info,
          text: "You have already completed this lesson",
        );
      } else {
        var result = await Navigator.push(
            context,
            new MaterialPageRoute(
              builder: (BuildContext context) => new WebviewScreen(
                url: "${Endpoints.webViewUrl}/lesson/${lesson.id}/mobile",
              ),
              fullscreenDialog: true,
            ));

        print(result);
        if (result == "success") {
          _firstLoad();
          CoolAlert.show(
            context: context,
            type: CoolAlertType.success,
            text: "Congratulations on completing this lesson",
          );
        }
        if (result == "false") {
          CoolAlert.show(
            context: context,
            type: CoolAlertType.error,
            text: "You were unable to complete this lesson",
          );
        }
      }
    }
  }

  _buildLessonList() {
    return Container(
      child: Column(
        children: [
          Container(
            height: 300,
            child: ListView.separated(
                padding: EdgeInsets.all(25),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  final lesson = _course?.lessons?[index];
                  return Container(
                    child: Stack(
                      children: [
                        GFListTile(
                            margin: EdgeInsets.only(
                                top: 10, right: 8, left: 8, bottom: 8),
                            color: Colors.black.withOpacity(0.1),
                            titleText: lesson?.title,
                            subTitleText: lesson?.summary,
                            icon: Icon(Icons.arrow_circle_right),
                            onTap: () => _handleWebviewResult(lesson!),
                            avatar: Positioned(
                              left: 12,
                              top: 12,
                              child: GFCheckbox(
                                size: GFSize.SMALL,
                                activeBgColor: GFColors.SUCCESS,
                                value: lesson!.isComplete ?? false,
                                onChanged: (value) => {},
                              ),
                            )),
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    SizedBox(height: 0),
                itemCount: _course?.lessons?.length ?? 0),
          )
        ],
      ),
    );
  }

  _buildTopbarCourseDetail() {
    return Container(
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 250,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                  child: Image.network(
                    _course!.imageUrl ?? DEFAULT_POST_IMAGE_URL,
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              ),
              SizedBox(height: 25)
            ],
          ),
          Positioned(
            bottom: 0,
            right: 50,
            child: _isComplete
                ? ElevatedButton(
                    child: Text('Compeleted'),
                    onPressed: () {},
                  )
                : _enrolled
                    ? ElevatedButton(
                        child: Text('Enrolled'),
                        onPressed: () {},
                      )
                    : ElevatedButton(
                        child: Text('Register'),
                        onPressed: () async {
                          await CoolAlert.show(
                            context: context,
                            type: CoolAlertType.info,
                            text: "Register this Course ?",
                            onConfirmBtnTap: () {
                              _handleEnrollCourse();
                              Navigator.pop(context);
                            },
                            showCancelBtn: true,
                          );
                        },
                      ),
          )
        ],
      ),
    );
  }
}
