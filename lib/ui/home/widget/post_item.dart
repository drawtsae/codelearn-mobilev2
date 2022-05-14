import 'package:boilerplate/models/post/post.dart';
import 'package:boilerplate/ui/post_detail/post_detail.dart';
import 'package:boilerplate/utils/extensions/time_ago.dart';

import 'package:flutter/material.dart';

class PostItem extends StatelessWidget {
  final Post post;

  const PostItem({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => PostDetailScreen(
            postId: post.id.toString(),
          ),
        ),
      ),
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
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
    );
  }
}
