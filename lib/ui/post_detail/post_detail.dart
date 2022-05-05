// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:boilerplate/utils/extensions/time_ago.dart';
import 'package:boilerplate/utils/social/social_media.dart';
import 'package:boilerplate/widgets/empty_app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttericon/font_awesome5_icons.dart';

import '../../models/post/post.dart';

class PostDetailScreen extends StatefulWidget {
  final Post post;

  const PostDetailScreen({Key? key, required this.post}) : super(key: key);

  @override
  _PostDetailScreenState createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  bool? isUpvote = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
            child: Icon(FontAwesome5.exclamation_triangle),
            label: 'report',
          ),
          SpeedDialChild(
            child: Icon(
              FontAwesome5.thumbs_down,
              color: isUpvote == false ? Colors.amber : Colors.black,
            ),
            label: 'down vote',
            onTap: () => setState(
              () {
                isUpvote = false;
              },
            ),
          ),
          SpeedDialChild(
            child: Icon(
              FontAwesome5.thumbs_up,
              color: isUpvote == true ? Colors.amber : Colors.black,
            ),
            label: 'up vote',
            onTap: () => setState(
              () {
                isUpvote = true;
              },
            ),
          ),
          SpeedDialChild(
            child: Icon(FontAwesome5.facebook),
            onTap: () => SocialMedia(
              type: SocialType.facebook,
              urlShare:
                  "https://codelearn-trteam.netlify.app/news/${widget.post.slug}",
              text: widget.post.summary,
            ).share(),
          ),
          SpeedDialChild(
            child: Icon(FontAwesome5.twitter),
            onTap: () => SocialMedia(
              type: SocialType.twitter,
              urlShare:
                  "https://codelearn-trteam.netlify.app/news/${widget.post.slug}",
              text: widget.post.summary,
            ).share(),
          ),
          SpeedDialChild(
            child: Icon(FontAwesome5.linkedin),
            onTap: () => SocialMedia(
              type: SocialType.linkedin,
              urlShare:
                  "https://codelearn-trteam.netlify.app/news/${widget.post.slug}",
              text: widget.post.summary,
            ).share(),
          )
        ],
      ),
      appBar: EmptyAppBar(),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              SizedBox(height: 80),
              Container(
                padding: EdgeInsets.all(8),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.network(
                        widget.post.author!.profilePicture ??
                            'https://i.ibb.co/4Vsxhz0/2.png',
                        width: 50,
                        height: 50,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: RichText(
                        text: TextSpan(
                            text:
                                '${widget.post.author!.firstName}  ${widget.post.author!.lastName}',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                            children: [
                              TextSpan(text: '\n'),
                              WidgetSpan(
                                child: Text(
                                  String.fromCharCode(0xf2ff),
                                  style: TextStyle(
                                    fontFamily:
                                        'MaterialIcons', //<-- fontFamily
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                              TextSpan(
                                text: ' ${widget.post.viewCount}',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              TextSpan(text: '       '),
                              WidgetSpan(
                                child: Text(
                                  String.fromCharCode(0xef6d),
                                  style: TextStyle(
                                    fontFamily:
                                        'MaterialIcons', //<-- fontFamily
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                              TextSpan(
                                text:
                                    ' ${widget.post.comments == null ? 0 : widget.post.comments!.length}',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              TextSpan(text: '       '),
                              WidgetSpan(
                                child: Text(
                                  String.fromCharCode(0xf051f),
                                  style: TextStyle(
                                    fontFamily:
                                        'MaterialIcons', //<-- fontFamily
                                    fontSize: 20.0,
                                  ),
                                ),
                              ),
                              TextSpan(
                                text:
                                    ' ${TimeAgo.timeAgoSinceDate(widget.post.createdAt)}',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.normal,
                                ),
                              )
                            ]),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  widget.post.title!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
              Center(
                child: Html(
                  data: widget.post.content,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
