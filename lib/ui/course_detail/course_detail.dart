import 'package:boilerplate/ui/course_detail/widget/course_detail_summary.dart';
import 'package:boilerplate/ui/course_detail/widget/topbar_course_detail.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class CourseDetailScreen extends StatefulWidget {
  _CourseDetailScreenState createState() => _CourseDetailScreenState();
}

class _CourseDetailScreenState extends State<CourseDetailScreen> {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopbarCourseDetail(),
            //----------
            CourseDatailSummary(),
            Container(
              child: GFListTile(
                  color: Colors.black.withOpacity(0.1),
                  titleText: 'Lesson 1',
                  subTitleText:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing',
                  icon: Icon(Icons.abc_sharp)),
            )
          ],
        ),
      ),
    );
  }
}
