import 'package:boilerplate/models/lesson/lesson.dart';

import 'package:boilerplate/ui/course_detail/widget/lesson_list_item.dart';

import 'package:flutter/material.dart';

class LessonList extends StatelessWidget {
  final List<Lesson> lessons;
  final bool isLoggin;
  const LessonList({Key? key, required this.lessons, required this.isLoggin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 300,
            child: ListView.separated(
                padding: EdgeInsets.all(25),
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) => LessonListItem(
                      lesson: lessons[index],
                      isLoggin: isLoggin,
                    ),
                separatorBuilder: (BuildContext context, int index) =>
                    SizedBox(height: 0),
                itemCount: lessons.length),
          )
        ],
      ),
    );
  }
}
