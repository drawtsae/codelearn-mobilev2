import 'package:boilerplate/data/network/apis/post_api.dart';
import 'package:boilerplate/data/post_repository.dart';
import 'package:boilerplate/di/components/service_locator.dart';
import 'package:boilerplate/models/post/post.dart';
import 'package:boilerplate/ui/post/post.constants.dart';
import 'package:boilerplate/ui/post/widget/post_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import '../../constants/common.dart';
import '../../constants/enums.dart';
import '../../models/post/post_list.dart';
import '../../widgets/shimmer_loading.dart';

class PostView extends StatefulWidget {
  _PostViewState createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  late PostRepository _postRepository;
  TextEditingController _searchField = TextEditingController();

  // Defines States
  bool _hasNextPage = true;
  int _pageNumber = 0;
  List<Post> _posts = EMPTY_POST_LIST;
  LoadingType _isLoading = LoadingType.None;
  String _keyword = EMPTY_STRING;

  // Defines Actions
  Future<void> _getPosts(
      {String keyword = EMPTY_STRING,
      List<String> categoryIds = EMPTY_LIST_STRING,
      List<String> tagIds = EMPTY_LIST_STRING,
      int pageSize = DEFAULT_PAGE_SIZE,
      int pageNumber = DEFAULT_PAGE_NUMBER,
      LoadingType loadingType = LoadingType.First}) async {
    setState(() {
      _isLoading = loadingType;
      if (loadingType == LoadingType.First) _searchField.text = EMPTY_STRING;
    });

    PostList? response;
    await Future.delayed(
        // Whenever loading more, must have to wait 1 second to send the request
        Duration(milliseconds: loadingType == LoadingType.First ? 0 : 1000),
        () async {
      response = await _postRepository.getPosts(_keyword, categoryIds, tagIds,
          'Sharing', true, true, pageNumber, pageSize);
    });

    setState(() {
      _posts =
          (keyword != _keyword ? EMPTY_POST_LIST : _posts) + response!.data!;
      _hasNextPage = response!.hasNextPage!;
      _pageNumber = pageNumber;
      _isLoading = LoadingType.None;
    });
  }

  // Defines handlers
  void handleFirstLoad() async {
    await _getPosts();
  }

  void handleLoadMore() async {
    if (_hasNextPage && _isLoading == LoadingType.None) {
      await _getPosts(
          keyword: _keyword,
          pageNumber: _pageNumber++,
          loadingType: LoadingType.More);
    }
  }

  void handleSearch() async {
    await _getPosts(keyword: _searchField.text, loadingType: LoadingType.First);
  }

  // Main
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        floatingActionButton:
            SpeedDial(animatedIcon: AnimatedIcons.menu_close, children: [
          SpeedDialChild(
            child: Icon(FontAwesome5.plus),
            label: 'Create Post',
          )
        ]),
        body: Stack(children: <Widget>[
          _buildMainContext(context),
        ]));
  }

  @override
  void initState() {
    super.initState();
    _postRepository = PostRepository(getIt<PostApi>());
    handleFirstLoad();
  }

  Widget _buildMainContext(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Padding(
          padding: EdgeInsets.all(20.0),
          child: TextField(
            controller: _searchField,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Search posts...',
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
                    child: ListView.separated(
                        itemBuilder: (context, index) =>
                            PostItem(post: _posts[index]),
                        separatorBuilder: (BuildContext context, int index) =>
                            SizedBox(height: 15),
                        itemCount: _posts.length),
                  )),
        if (_isLoading == LoadingType.More) ShimmerLoading()
      ],
    ));
  }
}
