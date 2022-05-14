import 'package:boilerplate/constants/assets.dart';
import 'package:boilerplate/models/common_model/comment.dart';
import 'package:boilerplate/ui/post_detail/widget/comment_item.dart';
import 'package:flutter/material.dart';

class CommentSection extends StatelessWidget {
  final List<Comment> comments;
  final VoidCallback? onReply;
  final VoidCallback? onDelete;
  const CommentSection({
    Key? key,
    required this.comments,
    this.onReply,
    this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: comments
            .map((val) => CommentItem(
                  comment: val,
                  isParrent: true,
                  onDelete: onDelete,
                  onReply: onReply,
                ))
            .toList(),
      ),
    );
  }
}
