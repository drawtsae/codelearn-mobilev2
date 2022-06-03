import 'package:boilerplate/models/common_model/comment.dart';
import 'package:boilerplate/ui/general_profile/general_profile.dart';
import 'package:boilerplate/utils/extensions/time_ago.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class CommentItem extends StatelessWidget {
  final Comment comment;
  final bool? isParrent;
  final VoidCallback? onReply;
  final VoidCallback? onDelete;

  const CommentItem(
      {Key? key,
      required this.comment,
      this.isParrent,
      this.onReply,
      this.onDelete})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => GeneralProfileSceen(
                  userId: comment.author?.id,
                ),
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100.0),
              child: GFAvatar(
                size: GFSize.SMALL,
                backgroundImage: NetworkImage(comment!.author?.profilePicture ??
                    'https://i.ibb.co/4Vsxhz0/2.png'),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    comment.author!.firstName ?? "",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(comment.content ?? ""),
                  Row(
                    children: [
                      Text(
                        "${TimeAgo.timeAgoSinceDate(comment.createdAt)}",
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontSize: 12,
                        ),
                      ),
                      isParrent == true
                          ? GestureDetector(
                              child: Text(
                                ' Reply ',
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.5),
                                  fontSize: 12,
                                ),
                              ),
                              onTap: onReply,
                            )
                          : Container(),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Column(
                      children: comment.comments == null
                          ? []
                          : comment.comments!
                              .map(
                                (val) => CommentItem(
                                  comment: val,
                                  isParrent: false,
                                  onReply: onReply,
                                ),
                              )
                              .toList(),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
