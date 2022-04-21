import 'package:boilerplate/data/network/apis/post_api.dart';
import 'package:boilerplate/data/post_repository.dart';
import 'package:boilerplate/di/components/service_locator.dart';
import 'package:boilerplate/models/post/post.dart';
import 'package:boilerplate/ui/post/widget/post_item.dart';
import 'package:boilerplate/widgets/progress_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class PostView extends StatefulWidget {
  _PostViewState createState() => _PostViewState();
}

class _PostViewState extends State<PostView> {
  late PostRepository _postRepository;
  // The controller for the ListView
  late ScrollController _controller;
  // At the beginning, we fetch the first 20 posts
  int _pageNum = 1;
  int _limitSize = 20;
  String _keyword = '';
  // There is next page or not
  bool _hasNextPage = true;

  // Used to display loading indicators when _firstLoad function is running
  bool _isFirstLoadRunning = false;

  // Used to display loading indicators when _loadMore function is running
  bool _isLoadMoreRunning = false;

  // This holds the posts fetched from the server
  List<Post> _posts = [];

  // This function will be called when the app launches (see the initState function)
  void _firstLoad() async {
    setState(() {
      _isFirstLoadRunning = true;
    });
    try {
      final postList = await _postRepository.getPosts(
          _keyword, [], [], 'News', true, true, _pageNum, _limitSize);
      setState(() {
        _posts = postList!.data!;
        //_hasNextPage = postList.hasNextPage!;
      });
    } catch (err) {
      print('Something went wrong');
    }

    setState(() {
      _isFirstLoadRunning = false;
    });
  }

  // This function will be triggered whenver the user scroll
  // to near the bottom of the list view
  void _loadMore() async {
    if (_hasNextPage == true &&
        _isFirstLoadRunning == false &&
        _isLoadMoreRunning == false &&
        _controller.position.extentAfter < 300) {
      setState(() {
        _isLoadMoreRunning = true; // Display a progress indicator at the bottom
      });
      _pageNum += 1; // Increase _page by 1
      try {
        final res = await _postRepository.getPosts(
            _keyword, [], [], 'News', true, true, _pageNum, _limitSize);

        setState(() {
          _posts.addAll(res!.data!);
          _hasNextPage = res.hasNextPage!;
        });
      } catch (err) {
        print('Something went wrong!');
      }

      setState(() {
        _isLoadMoreRunning = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _handleErrorMessage(),
        _buildMainContent(context),
      ],
    );
  }

  Widget _handleErrorMessage() {
    return Observer(
      builder: (context) {
        //if (_postStore.errorStore.errorMessage.isNotEmpty) {
        //  return _showErrorMessage(_postStore.errorStore.errorMessage);
        //}

        return SizedBox.shrink();
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _postRepository = PostRepository(getIt<PostApi>());
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
                    padding: EdgeInsets.all(25),
                    itemBuilder: (context, index) =>
                        PostItem(post: _posts[index]),
                    separatorBuilder: (BuildContext context, int index) =>
                        SizedBox(height: 15),
                    itemCount: _posts.length,
                  ),
                ),
                // when the _loadMore function is running
                if (_isLoadMoreRunning == true)
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 40),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),

                // When nothing else to load
                //if (_hasNextPage == false)
                //  Container(
                //    padding: const EdgeInsets.only(top: 30, bottom: 40),
                //    color: Colors.amber,
                //    child: Center(
                //      child: Text('You have fetched all of the content'),
                //    ),
                //  ),
              ],
            ),
    );
  }
}
