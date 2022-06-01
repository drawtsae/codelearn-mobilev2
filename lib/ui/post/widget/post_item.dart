import 'package:boilerplate/constants/common.dart';
import 'package:boilerplate/models/post/post.dart';
import 'package:boilerplate/utils/extensions/time_ago.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import '../../../constants/number.dart';
import '../../../constants/url.dart';
import '../../post_detail/post_detail.dart';

class PostItem extends StatelessWidget {
  final Post post;
  const PostItem({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => PostDetailScreen(
            postId: post.id.toString(),
          ),
        ),
      ),
      child: GFCard(
        boxFit: BoxFit.cover,
        titlePosition: GFPosition.start,
        showImage: true,
        title: GFListTile(
          avatar: GFAvatar(
              backgroundImage:
                  NetworkImage(post.author?.profilePicture ?? EMPTY_STRING)),
          titleText: post.title,
          subTitleText: ("${post.author?.firstName} ${post.author?.lastName}"),
        ),
        content: Text(
          post.summary.toString(),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Colors.grey),
        ),
        buttonBar: GFButtonBar(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Text(TimeAgo.timeAgoSinceDate(post.createdAt)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(Icons.remove_red_eye),
                      Text(post.viewCount == null
                          ? NUMBER_ZERO.toString()
                          : post.viewCount.toString()),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
