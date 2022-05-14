import 'package:boilerplate/models/common_model/comment.dart';
import 'package:boilerplate/utils/extensions/time_ago.dart';
import 'package:flutter/material.dart';

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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100.0),
          child: Image.network(
            comment.author!.profilePicture ?? "",
            width: isParrent == true ? 35 : 25,
            height: isParrent == true ? 35 : 25,
            fit: BoxFit.fill,
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
                    GestureDetector(
                      child: Text(
                        ' Delete ',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontSize: 12,
                        ),
                      ),
                      onTap: onDelete,
                    ),
                  ],
                ),
                Column(
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
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
