import 'package:boilerplate/models/course/course.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class CourseItem extends StatelessWidget {
  const CourseItem({Key? key, required String content}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GFCard(
      boxFit: BoxFit.cover,
      titlePosition: GFPosition.start,
      image: Image.network(
        'https://www.studytienganh.vn/upload/2021/06/106292.jpg',
        height: MediaQuery.of(context).size.height * 0.2,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      ),
      showImage: true,
      title: GFListTile(
        avatar: GFAvatar(
          backgroundImage: NetworkImage(
              'https://www.studytienganh.vn/upload/2021/06/106292.jpg'),
        ),
        titleText: 'Course name',
        subTitleText: 'author',
      ),
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text("There is some description for this course"),
      ),
      buttonBar: GFButtonBar(
        children: <Widget>[
          GFRating(
            value: 5,
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}
