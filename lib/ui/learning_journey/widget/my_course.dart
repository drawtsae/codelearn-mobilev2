import 'package:boilerplate/constants/common.dart';
import 'package:boilerplate/data/course_repository.dart';
import 'package:boilerplate/data/network/apis/course_api.dart';
import 'package:boilerplate/di/components/service_locator.dart';
import 'package:boilerplate/models/course/course.dart';
import 'package:boilerplate/models/post/post.dart';
import 'package:boilerplate/utils/extensions/time_ago.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class MyCourseWidget extends StatefulWidget {
  @override
  _MyCourseWidgetState createState() => _MyCourseWidgetState();
}

class _MyCourseWidgetState extends State<MyCourseWidget> {
  //filter
  bool _completedFilter = true;
  bool _inCompletedFilter = true;
  bool _loading = true;

  List<Course> _coursesData = [];
  late CourseRepository _courseRepository;

  List<String> getfilters() {
    var filter = [
      _completedFilter == true ? "Completed" : EMPTY_STRING,
      _inCompletedFilter == true ? "InCompleted" : EMPTY_STRING
    ];
    return filter.where((element) => element.isNotEmpty).toList();
  }

  void firstLoad() async {
    loadUserCourse();
  }

  void loadUserCourse() async {
    setState(() {
      _loading = true;
    });
    var data = await _courseRepository.getUserCourses(getfilters());
    setState(() {
      _coursesData = data;
      _loading = false;
    });
  }

  @override
  void initState() {
    _courseRepository = CourseRepository(getIt<CourseApi>());
    super.initState();
    firstLoad();
  }

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        child: Padding(
      padding: const EdgeInsets.all(10),
      child: ScrollOnExpand(
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: <Widget>[
              ExpandablePanel(
                theme: const ExpandableThemeData(
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  tapBodyToExpand: true,
                  hasIcon: false,
                ),
                header: Container(
                  color: Colors.amber.shade300,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        ExpandableIcon(
                          theme: const ExpandableThemeData(
                            expandIcon: Icons.arrow_right,
                            collapseIcon: Icons.arrow_drop_down,
                            iconColor: Colors.black,
                            iconSize: 28.0,
                            iconRotationAngle: 3.14 / 2,
                            iconPadding: EdgeInsets.only(right: 5),
                            hasIcon: false,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "My Courses",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                collapsed: Container(),
                expanded: buildList(),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  buildItem(Course course) {
    return GestureDetector(
      onTap: () => {print('hit')},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 5,
                spreadRadius: 0,
                offset: Offset(3.0, 3.0), // shadow direction: bottom right
              )
            ],
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: ClipRRect(
                  child: Image.network(
                    course.imageUrl ?? 'https://i.ibb.co/4Vsxhz0/2.png',
                    height: 85,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        TimeAgo.timeAgoSinceDate(course.createdAt,
                            numericDates: false),
                        style: TextStyle(fontSize: 11),
                      ),
                      Text(
                        course.title ?? '',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Container(
                        height: 32,
                        child: Text(
                          course.summary ?? '',
                          overflow: TextOverflow.clip,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  buildFilter() {
    return Container(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: FilterChip(
              label: Text("Completed"),
              selected: _completedFilter,
              onSelected: (bool value) {
                setState(() {
                  _completedFilter = value;
                  loadUserCourse();
                });
              },
              selectedColor: Colors.amber.shade100,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: FilterChip(
              label: Text("Incompleted"),
              selected: _inCompletedFilter,
              onSelected: (bool value) {
                setState(() {
                  _inCompletedFilter = value;
                  loadUserCourse();
                });
              },
              selectedColor: Colors.amber.shade100,
            ),
          ),
        ],
      ),
    );
  }

  buildList() {
    return Column(
      children: <Widget>[
        buildFilter(),
        _loading
            ? CircularProgressIndicator()
            : _coursesData.length == 0
                ? Center(child: Text('No course available'))
                : Column(
                    children: _coursesData
                        .map((p) => buildItem(p) as Widget)
                        .toList(),
                  )
      ],
    );
  }
}
