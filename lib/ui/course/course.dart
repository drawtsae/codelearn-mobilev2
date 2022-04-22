import 'package:flutter/material.dart';

import '../../data/course_repository.dart';
import '../../data/network/apis/course_api.dart';
import '../../di/components/service_locator.dart';
import '../../models/course/course.dart';
import '../../ui/course/widgets/course_item.dart';
import '../../widgets/load_more_spinner.dart';
import '../../widgets/progress_indicator_widget.dart';

class CourseView extends StatefulWidget {
  State<CourseView> createState() => _CourseViewState();
}

class _CourseViewState extends State<CourseView> {
  late CourseRepository _courseRepository;
  late ScrollController _controller;

  int _pageNum = 1;
  int _limitSize = 20;
  String _keyword = '';
  bool _hasNextPage = true;
  bool _isFirstLoadRunning = false;
  bool _isLoadMoreRunning = false;

  List<Course> _courses = [];

  void _getCourses(String keyword, pageNum, limitSize, sortBy) async {
    try {
      final res = await _courseRepository.getCourses(
          keyword, pageNum, limitSize, sortBy);
      setState(() {
        _courses = res!.data!;
        _hasNextPage = res.hasNextPage!;
      });
    } catch (err) {
      print('Some thing error when get course!');
    }
  }

  void _firstLoad() async {
    setState(() {
      _isFirstLoadRunning = true;
    });
    _getCourses(_keyword, _pageNum, _limitSize, 'DateDESC');
    setState(() {
      _isFirstLoadRunning = false;
    });
  }

  void _loadMore() async {
    final conditionToLoad = _hasNextPage &&
        !_isFirstLoadRunning &&
        !_isLoadMoreRunning &&
        _controller.position.extentAfter < 300;

    if (conditionToLoad) {
      setState(() {
        _isLoadMoreRunning = true;
        _pageNum += 1;
      });
      _getCourses(_keyword, _pageNum, _limitSize, 'DateDESC');
      setState(() {
        _isLoadMoreRunning = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _buildMainContent(context),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _courseRepository = CourseRepository(getIt<CourseApi>());
    _firstLoad();
    _controller = new ScrollController()..addListener(_loadMore);
  }

  @override
  void dispose() {
    _controller.removeListener(_loadMore);
    super.dispose();
  }

  Widget _buildMainContent(BuildContext context) {
    return Container(
      child: _isFirstLoadRunning
          ? CustomProgressIndicatorWidget()
          : Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    controller: _controller,
                    itemBuilder: (context, index) =>
                        CourseItem(course: _courses[index]),
                    separatorBuilder: (BuildContext context, int index) =>
                        SizedBox(height: 15),
                    itemCount: _courses.length,
                  ),
                ),
                if (_isLoadMoreRunning) LoadMoreSpinner()
              ],
            ),
    );
  }
}
