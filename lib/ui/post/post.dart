import 'package:boilerplate/data/network/apis/post_api.dart';
import 'package:boilerplate/data/post_repository.dart';
import 'package:boilerplate/di/components/service_locator.dart';
import 'package:boilerplate/models/post/post.dart';
import 'package:boilerplate/ui/post/widget/post_item.dart';
import 'package:boilerplate/widgets/progress_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class PostView extends StatelessWidget {
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

  Widget _buildMainContent(BuildContext context) {
    //return Observer(
    //  builder: (context) {
    //   return true == false
    //       ? CustomProgressIndicatorWidget()
    //       : Material(child: _buildHomeBody());
    // },
    //);
    late PostRepository _postRepository = PostRepository(getIt<PostApi>());
    var postList =
        _postRepository.getPosts("", [], [], "news", true, true, 1, 10);
    return Container(
      child: FutureBuilder(
        future: postList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var posts = snapshot.data as List<Post>;
            return ListView.separated(
                padding: EdgeInsets.all(25),
                itemBuilder: (context, index) => PostItem(post: posts[index]),
                separatorBuilder: (BuildContext context, int index) =>
                    SizedBox(height: 15),
                itemCount: posts.length);
          } else {
            return CustomProgressIndicatorWidget();
          }
        },
      ),
    );
  }
}
