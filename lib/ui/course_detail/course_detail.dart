import 'package:boilerplate/data/course_repository.dart';
import 'package:boilerplate/data/network/apis/course_api.dart';
import 'package:boilerplate/data/sharedpref/shared_preference_helper.dart';
import 'package:boilerplate/di/components/service_locator.dart';
import 'package:boilerplate/models/course/course.dart';
import 'package:boilerplate/ui/course_detail/widget/course_detail_summary.dart';
import 'package:boilerplate/ui/course_detail/widget/lesson_list.dart';
import 'package:boilerplate/ui/course_detail/widget/topbar_course_detail.dart';
import 'package:boilerplate/widgets/progress_indicator_widget.dart';
import 'package:flutter/material.dart';
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

  // This holds the posts fetched from the server
  Course? _course;

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
                  TopbarCourseDetail(
                    course: _course!,
                    isLoggin: _isLogin,
                  ),
                  //----------
                  CourseDetailSummary(course: _course!),
                  LessonList(
                    lessons: _course!.lessons!,
                    isLoggin: _isLogin,
                  )
                ],
              ),
            ),
    );
  }
}
