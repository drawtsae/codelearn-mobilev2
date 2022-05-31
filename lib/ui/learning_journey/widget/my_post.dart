import 'package:boilerplate/constants/common.dart';
import 'package:boilerplate/data/network/apis/post_api.dart';
import 'package:boilerplate/data/post_repository.dart';
import 'package:boilerplate/di/components/service_locator.dart';
import 'package:boilerplate/models/post/post.dart';
import 'package:boilerplate/utils/extensions/time_ago.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class MyPostWidget extends StatefulWidget {
  @override
  _MyPostWidgetState createState() => _MyPostWidgetState();
}

class _MyPostWidgetState extends State<MyPostWidget> {
  //filter
  bool _activeFilter = true;
  bool _pendingFilter = true;
  bool _likedFilter = true;
  bool _disLikedFilter = true;
  bool _loading = true;

  List<Post> _postsData = [];

  late PostRepository _postRepository;

  List<String> getfilters() {
    var filter = [
      _activeFilter == true ? "Active" : EMPTY_STRING,
      _pendingFilter == true ? "Pending" : EMPTY_STRING,
      _likedFilter == true ? "Liked" : EMPTY_STRING,
      _disLikedFilter == true ? "DisLiked" : EMPTY_STRING
    ];
    return filter.where((element) => element.isNotEmpty).toList();
  }

  void firstLoad() async {
    loadUserPost();
  }

  void loadUserPost() async {
    setState(() {
      _loading = true;
    });
    var data = await _postRepository.getUserPost(getfilters());
    setState(() {
      _postsData = data;
      _loading = false;
    });
  }

  @override
  void initState() {
    _postRepository = PostRepository(getIt<PostApi>());
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
                            "My Posts",
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

  buildItem(Post post) {
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
                    post.imageUrl ?? 'https://i.ibb.co/4Vsxhz0/2.png',
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
                        TimeAgo.timeAgoSinceDate(post.createdAt,
                            numericDates: false),
                        style: TextStyle(fontSize: 11),
                      ),
                      Text(
                        post.title ?? '',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Container(
                        height: 32,
                        child: Text(
                          post.summary ?? '',
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
              label: Text("Active"),
              selected: _activeFilter,
              onSelected: (bool value) {
                setState(() {
                  _activeFilter = value;
                  loadUserPost();
                });
              },
              selectedColor: Colors.amber.shade100,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: FilterChip(
              label: Text("Pending"),
              selected: _pendingFilter,
              onSelected: (bool value) {
                setState(() {
                  _pendingFilter = value;
                  loadUserPost();
                });
              },
              selectedColor: Colors.amber.shade100,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: FilterChip(
              label: Text("Liked"),
              selected: _likedFilter,
              onSelected: (bool value) {
                setState(() {
                  _likedFilter = value;
                  loadUserPost();
                });
              },
              selectedColor: Colors.amber.shade100,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: FilterChip(
              label: Text("DisLiked"),
              selected: _disLikedFilter,
              onSelected: (bool value) {
                setState(() {
                  _disLikedFilter = value;
                  loadUserPost();
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
            : _postsData.length == 0
                ? Center(child: Text('No post available'))
                : Column(
                    children:
                        _postsData.map((p) => buildItem(p) as Widget).toList(),
                  )
      ],
    );
  }
}
