import 'package:boilerplate/constants/assets.dart';
import 'package:boilerplate/models/common_model/comment.dart';
import 'package:boilerplate/ui/post_detail/widget/comment_item.dart';
import 'package:flutter/material.dart';

class CommentSection extends StatefulWidget {
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
  State<CommentSection> createState() => _CommentSectionState();
}

class _CommentSectionState extends State<CommentSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: widget.comments
            .map((val) => CommentItem(
                  comment: val,
                  isParrent: true,
                  onDelete: widget.onDelete,
                  onReply: widget.onReply,
                ))
            .toList(),
      ),
    );
  }
}
