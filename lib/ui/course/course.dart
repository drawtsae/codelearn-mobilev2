import 'package:boilerplate/constants/enums.dart';
import 'package:boilerplate/constants/number.dart';
import 'package:boilerplate/ui/course/course.constants.dart';
import 'package:empty_widget/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import '../../constants/common.dart';
import '../../data/course_repository.dart';
import '../../data/network/apis/course_api.dart';
import '../../di/components/service_locator.dart';
import '../../models/course/course.dart';
import '../../models/course/course_list.dart';
import '../../ui/course/widgets/course_item.dart';
import '../../widgets/empty_list.dart';
import '../../widgets/shimmer_loading.dart';

class CourseView extends StatefulWidget {
  State<CourseView> createState() => _CourseViewState();
}

class _CourseViewState extends State<CourseView> {
  late CourseRepository _courseRepository;

  // Defines States
  TextEditingController _searchField = TextEditingController();
  bool _hasNextPage = true;
  int _pageNumber = NUMBER_ONE;
  List<Course> _courses = EMPTY_COURSE_LIST;
  LoadingType _isLoading = LoadingType.None;
  String _keyword = EMPTY_STRING;

  Future<void> _getCourses(
      {String keyword = EMPTY_STRING,
      pageNumber = DEFAULT_PAGE_NUMBER,
      pageSize = DEFAULT_PAGE_SIZE,
      sortBy = 'DateDESC',
      LoadingType loadingType = LoadingType.First}) async {
    setState(() {
      _isLoading = loadingType;
      if (loadingType == LoadingType.First) _searchField.text = EMPTY_STRING;
    });

    CourseList? response;
    await Future.delayed(
        // Whenever loading more, must have to wait 1 second to send the request
        Duration(milliseconds: loadingType == LoadingType.First ? 0 : 1000),
        () async {
      response = await _courseRepository.getCourses(
          keyword, pageNumber, pageSize, sortBy);
    });

    setState(() {
      _courses =
          ((loadingType == LoadingType.More) ? _courses : EMPTY_COURSE_LIST) +
              response!.data!;
      _hasNextPage = response!.hasNextPage!;
      _pageNumber = pageNumber;
      _isLoading = LoadingType.None;
    });
  }

  // Defines handlers
  void handleFirstLoad() async {
    await _getCourses();
  }

  void handleLoadMore() async {
    if (_hasNextPage && _isLoading == LoadingType.None) {
      await _getCourses(
          keyword: _keyword,
          pageNumber: _pageNumber + 1,
          loadingType: LoadingType.More);
    }
  }

  void handleSearch() async {
    await _getCourses(
        keyword: _searchField.text, loadingType: LoadingType.First);
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
    handleFirstLoad();
  }

  Widget _buildMainContent(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Padding(
          padding: EdgeInsets.all(20.0),
          child: TextField(
            controller: _searchField,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Search courses...',
                suffixIcon: IconButton(
                  onPressed: () => handleSearch(),
                  icon: Icon(Icons.search),
                )),
          ),
        ),
        Expanded(
            child: (_isLoading == LoadingType.First)
                ? ShimmerLoading()
                : LazyLoadScrollView(
                    // isLoading: _isLoading == LoadingType.More,
                    onEndOfPage: () => handleLoadMore(),
                    child: _courses.length == NUMBER_ZERO
                        ? EmptyList(
                            listName: "course",
                          )
                        : ListView.separated(
                            itemBuilder: (context, index) =>
                                CourseItem(course: _courses[index]),
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    SizedBox(height: 15),
                            itemCount: _courses.length),
                  )),
        if (_isLoading == LoadingType.More) ShimmerLoading(),
      ],
    ));
  }
}
