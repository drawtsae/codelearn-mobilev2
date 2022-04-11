import 'package:boilerplate/data/course_repository.dart';
import 'package:boilerplate/data/network/apis/course_api.dart';
import 'package:boilerplate/di/components/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final CourseRepository _courseRepository =
      CourseRepository(getIt<CourseApi>());

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var a = _courseRepository.getCourseById("1").then((value) => null);
    return Testw();
  }
}

class Testw extends StatelessWidget {
  const Testw({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(),
    );
  }
}
