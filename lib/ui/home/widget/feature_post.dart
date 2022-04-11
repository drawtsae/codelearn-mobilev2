import 'package:boilerplate/data/network/apis/post_api.dart';
import 'package:boilerplate/data/post_repository.dart';
import 'package:boilerplate/di/components/service_locator.dart';
import 'package:boilerplate/models/post/post.dart';
import 'package:boilerplate/ui/home/widget/category_title.dart';
import 'package:boilerplate/ui/home/widget/post_item.dart';
import 'package:flutter/material.dart';

class FeaturePost extends StatelessWidget {
  final PostRepository _postRepository = PostRepository(getIt<PostApi>());

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CategoryTitle(leftText: 'Top news.', rightText: 'view all'),
          Container(
            height: 300,
            child: FutureBuilder(
                future: _postRepository.getPosts(
                    '', [], [], 'News', false, false, 1, 5),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var postList = snapshot.data as List<Post>;
                    print(postList);
                    return ListView.separated(
                        padding: EdgeInsets.all(25),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) =>
                            PostItem(post: postList[index]),
                        separatorBuilder: (BuildContext context, int index) =>
                            SizedBox(height: 15),
                        itemCount: postList.length);
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }),
          )
        ],
      ),
    );
  }
}
