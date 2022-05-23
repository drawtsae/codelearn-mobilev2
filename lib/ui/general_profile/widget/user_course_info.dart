import 'package:boilerplate/data/course_repository.dart';
import 'package:boilerplate/data/network/apis/course_api.dart';
import 'package:boilerplate/di/components/service_locator.dart';
import 'package:boilerplate/models/course/course.dart';
import 'package:boilerplate/models/course/course_list.dart';
import 'package:boilerplate/ui/home/widget/course_item.dart';
import 'package:flutter/material.dart';

class UserCoursesInfo extends StatelessWidget {
  final List<Course> listCourse;

  const UserCoursesInfo({Key? key, required this.listCourse}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "COURSES",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Container(
            height: 300,
            child: ListView.separated(
              padding: EdgeInsets.all(25),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>
                  CourseItem(course: listCourse[index]),
              separatorBuilder: (BuildContext context, int index) =>
                  SizedBox(width: 15),
              itemCount: listCourse.length,
            ),
          ),
        ],
      ),
    );
  }
}
