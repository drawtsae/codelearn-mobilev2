import 'package:boilerplate/models/post/post.dart';
import 'package:boilerplate/models/tag/tag.dart';
import 'package:boilerplate/ui/post_detail/post_detail.dart';
import 'package:boilerplate/utils/extensions/hex_color.dart';
import 'package:boilerplate/utils/extensions/time_ago.dart';
import 'package:flutter/material.dart';

class PostItem extends StatelessWidget {
  final Post post;
  const PostItem({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      color: Colors.amber[50],
      child: Column(children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.all(5),
            child: Column(children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PostDetailScreen(
                        postId: post.id.toString(),
                      ),
                    ),
                  ),
                  child: Image.network(
                    post.imageUrl ?? 'https://i.ibb.co/4Vsxhz0/2.png',
                    alignment: Alignment.center,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                flex: 4,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.topLeft,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          post.title ?? "",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        RichText(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 5,
                          text: TextSpan(
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.7)),
                              text: post.summary),
                        ),
                        Container(
                          height: 20,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) =>
                                _buildTag(post.tags![index]),
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    SizedBox(width: 15),
                            itemCount: post.tags!.length,
                          ),
                        ),
                      ]),
                ),
                flex: 6,
              ),
            ]),
          ),
          flex: 85,
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  width: 0.9,
                  color: Colors.black.withOpacity(0.3),
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.account_circle_outlined),
                    Text(post.author!.firstName.toString()),
                  ],
                ),
                Text(TimeAgo.timeAgoSinceDate(post.createdAt)),
                Row(
                  children: [
                    Icon(Icons.remove_red_eye_outlined),
                    Text(post.viewCount == null
                        ? '0'
                        : post.viewCount.toString()),
                  ],
                )
              ],
            ),
          ),
          flex: 15,
        )
      ]),
    );
  }

  Container _buildTag(Tag tag) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        color: HexColor.fromHex(tag.color.toString()),
      ),
      height: 20,
      padding: EdgeInsets.only(left: 5, right: 5),
      child: Text(
        tag.name.toString(),
        style: TextStyle(
          color: HexColor.fromHex(tag.color.toString()).computeLuminance() < 0.5
              ? Colors.white
              : Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
