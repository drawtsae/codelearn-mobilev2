import 'package:boilerplate/models/course/course.dart';
import 'package:flutter/material.dart';

class TopbarCourseDetail extends StatelessWidget {
  final Course course;
  final bool isLoggin;
  const TopbarCourseDetail(
      {Key? key, required this.course, required this.isLoggin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                    course.imageUrl!,
                    fit: BoxFit.cover,
                    width: size.width,
                  ),
                ),
              ),
              SizedBox(height: 25)
            ],
          ),
          Positioned(
            bottom: 0,
            right: 50,
            child: course.enrolled!
                ? ElevatedButton(
                    child: Text('Enrolled'),
                    onPressed: () {},
                  )
                : ElevatedButton(
                    child: Text('Register'),
                    onPressed: () {},
                  ),
          )
        ],
      ),
    );
  }
}
