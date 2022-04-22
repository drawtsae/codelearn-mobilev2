import 'package:boilerplate/models/course/course.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class CourseItem extends StatelessWidget {
  final Course course;
  const CourseItem({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GFCard(
      boxFit: BoxFit.cover,
      titlePosition: GFPosition.start,
      image: Image.network(
        course.imageUrl.toString(),
        height: MediaQuery.of(context).size.height * 0.2,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      ),
      showImage: true,
      title: GFListTile(
        avatar: GFAvatar(
          backgroundImage: NetworkImage(course.author?.profilePicture ?? ""),
        ),
        titleText: course.title,
        subTitleText:
            ("${course.author?.firstName} ${course.author?.lastName}"),
      ),
      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          course.summary.toString(),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      buttonBar: GFButtonBar(
        children: <Widget>[
          GFRating(
            value: course.rateScore?.toDouble() ?? 0,
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}
