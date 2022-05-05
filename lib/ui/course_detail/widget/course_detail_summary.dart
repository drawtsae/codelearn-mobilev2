import 'package:boilerplate/models/course/course.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class CourseDatailSummary extends StatelessWidget {
  final Course course;
  const CourseDatailSummary({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 40,
                width: 40,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    course.author!.profilePicture!,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                height: 40,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: Text(
                          "${course.author!.firstName!} ${course.author!.lastName!}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: Colors.amber,
                        ),
                        height: 20,
                        padding: EdgeInsets.only(left: 5, right: 5),
                        child: Text(
                          course.author!.memberTier ?? "Classic",
                          style: TextStyle(
                            color: Colors.amber.computeLuminance() < 0.5
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      flex: 1,
                    )
                  ],
                ),
              ),
            ],
          ),
          Html(
            data: course.content,
          ),
        ],
      ),
    );
  }
}
