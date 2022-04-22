// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:boilerplate/utils/extensions/time_ago.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../models/post/post.dart';

class PostDetailScreen extends StatefulWidget {
  final Post post;

  const PostDetailScreen({Key? key, required this.post}) : super(key: key);

  @override
  _PostDetailScreenState createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        // backgroundColor: Color(0x44000000),
        leading: Padding(
          padding: const EdgeInsets.only(
            left: 10,
            top: 10,
          ),
          child: ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Icon(Icons.arrow_back_ios_outlined),
            style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(0, 0, 0, 0), // <-- Button color
              // <-- Splash color
            ),
          ),
        ),
      ),
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
