import 'package:boilerplate/models/lesson/lesson.dart';
import 'package:boilerplate/ui/webview/webview.dart';
import 'package:boilerplate/utils/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class LessonListItem extends StatelessWidget {
  final Lesson lesson;
  final bool isLoggin;
  const LessonListItem({Key? key, required this.lesson, required this.isLoggin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          GFListTile(
            margin: EdgeInsets.only(top: 10, right: 8, left: 8, bottom: 8),

            color: Colors.black.withOpacity(0.1),
            titleText: lesson.title,
            subTitleText: lesson.summary,
            icon: Icon(Icons.arrow_circle_right),
            onTap: () => isLoggin
                ? Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => WebviewScreen(
                        url:
                            "https://codelearn-trteam.netlify.app/lesson/${lesson.id}",
                      ),
                    ),
                  )
                : Navigator.of(context).pushNamed(Routes.login),
            // go to lesson detail
          ),
          Positioned(
            left: 12,
            top: 12,
            child: Icon(
              lesson.isComplete!
                  ? Icons.check_box
                  : Icons.check_box_outline_blank,
              color: Colors.green,
            ),
          )
        ],
      ),
    );
  }
}
