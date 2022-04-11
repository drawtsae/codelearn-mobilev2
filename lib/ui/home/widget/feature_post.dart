import 'package:boilerplate/models/post/post.dart';
import 'package:boilerplate/ui/home/widget/category_title.dart';
import 'package:boilerplate/ui/home/widget/post_item.dart';
import 'package:flutter/material.dart';

class FeaturePost extends StatelessWidget {
  final List<Post> postList = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CategoryTitle(leftText: 'Top new.', rightText: 'view all'),
          Container(
            height: 300,
            child: ListView.separated(
                padding: EdgeInsets.all(25),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) =>
                    PostItem(post: postList[index]),
                separatorBuilder: (BuildContext context, int index) =>
                    SizedBox(width: 15),
                itemCount: postList.length),
          )
        ],
      ),
    );
  }
}
