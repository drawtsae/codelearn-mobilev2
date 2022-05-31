import 'package:boilerplate/data/course_repository.dart';
import 'package:boilerplate/data/network/apis/course_api.dart';
import 'package:boilerplate/di/components/service_locator.dart';
import 'package:boilerplate/models/course/course.dart';
import 'package:boilerplate/models/course/course_list.dart';

import 'package:boilerplate/ui/home/widget/category_title.dart';
import 'package:boilerplate/ui/home/widget/course_item.dart';
import 'package:flutter/material.dart';

class FeatureCourse extends StatelessWidget {
  final PageController pageController;
  final CourseRepository _courseRepository =
      CourseRepository(getIt<CourseApi>());

  FeatureCourse({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CategoryTitle(
            leftText: 'Suggestion course',
            rightText: 'View all',
            onNavigate: () => pageController.jumpToPage(2),
          ),
          Container(
            height: 300,
            child: FutureBuilder(
              future: _courseRepository.getCourses('', 1, 5, 'ViewASC'),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var courseList = snapshot.data as CourseList;
                  return ListView.separated(
                    padding: EdgeInsets.all(25),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) =>
                        CourseItem(course: courseList.data![index]),
                    separatorBuilder: (BuildContext context, int index) =>
                        SizedBox(width: 15),
                    itemCount: courseList.data?.length ?? 0,
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
