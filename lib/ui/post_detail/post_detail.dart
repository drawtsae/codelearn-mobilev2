// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:boilerplate/constants/assets.dart';
import 'package:boilerplate/data/comment_repository.dart';
import 'package:boilerplate/data/network/apis/comment_api.dart';
import 'package:boilerplate/data/network/apis/post_api.dart';
import 'package:boilerplate/data/network/constants/endpoints.dart';
import 'package:boilerplate/data/post_repository.dart';
import 'package:boilerplate/di/components/service_locator.dart';
import 'package:boilerplate/models/common_model/author.dart';
import 'package:boilerplate/models/common_model/comment.dart';
import 'package:boilerplate/models/post/post.dart';
import 'package:boilerplate/stores/user/user_store.dart';
import 'package:boilerplate/ui/general_profile/general_profile.dart';
import 'package:boilerplate/ui/post_detail/widget/comment_item.dart';
import 'package:boilerplate/utils/extensions/time_ago.dart';
import 'package:boilerplate/utils/social/social_media.dart';
import 'package:boilerplate/widgets/empty_app_bar_widget.dart';
import 'package:boilerplate/widgets/progress_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:getwidget/getwidget.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/sharedpref/shared_preference_helper.dart';

class PostDetailScreen extends StatefulWidget {
  final String postId;

  const PostDetailScreen({Key? key, required this.postId}) : super(key: key);

  @override
  _PostDetailScreenState createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen>
    with WidgetsBindingObserver {
  bool? isUpvote;
  bool isLoading = true;
  String? _dropDownValue;
  String? _parentReplyComment;
  String? _hintText;
  var _isKeyboardVisible = false;
  bool _isLogin = false;
  String _commentContent = "";
  var _currentUser = null;

  late SharedPreferenceHelper _sharedPreferenceHelper;
  late PostRepository _postRepository;
  late CommentRepository _commentRepository;
  final FocusNode myFocusNode = FocusNode();
  final TextEditingController _commentController = TextEditingController();
  late UserStore _userStore;
  Post? _post;

  @override
  void initState() {
    super.initState();
    _postRepository = PostRepository(getIt<PostApi>());
    _commentRepository = CommentRepository(getIt<CommentApi>());
    _sharedPreferenceHelper =
        SharedPreferenceHelper(getIt<SharedPreferences>());
    WidgetsBinding.instance.addObserver(this);

    firstLoad();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _userStore = Provider.of<UserStore>(context);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _userStore.dispose();
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    final bottomInset = WidgetsBinding.instance.window.viewInsets.bottom;
    final newValue = bottomInset > 0.0;
    if (newValue != _isKeyboardVisible) {
      setState(() {
        _isKeyboardVisible = newValue;
        if (_isKeyboardVisible == false) {
          _parentReplyComment = null;
          _hintText = 'Comment...';
        }
      });
    }
  }

  void firstLoad() async {
    var data = await _postRepository.getPostById(widget.postId);
    var loginStatus = await _sharedPreferenceHelper.isLoggedIn;
    var currentUser = await _userStore.getCurrentUserInfo();

    setState(() {
      _post = data;
      isLoading = false;
      _hintText = "Comment...";
      _isLogin = loginStatus;
      isUpvote = data?.voteStatus;
      _currentUser = currentUser;
    });
  }

  void votePostAction() async {
    var status = isUpvote == null
        ? 0
        : isUpvote == true
            ? -1
            : 1;
    try {
      _postRepository.votePosts(widget.postId, status);
      setState(() {
        isUpvote = isUpvote == true ? false : true;
      });
    } catch (e) {
      print(e);
    }
  }

  void commentAction(
      String value, void Function(void Function()) setState) async {
    if (value.isEmpty) return;

    final commentLevel = _parentReplyComment == null ? 0 : 1;
    var newCommentId = await _commentRepository.createComment(
      _parentReplyComment,
      commentLevel,
      value,
      "Post",
      widget.postId,
    );
    var currentUser = await _userStore.getCurrentUserInfo();
    final now = DateTime.now();
    Comment newComment = Comment(
      id: newCommentId,
      parentId: _parentReplyComment,
      commentLevel: commentLevel,
      isActive: true,
      content: value,
      author: Author(
        id: currentUser?.id,
        firstName: currentUser?.firstName,
        lastName: currentUser?.lastName,
        profilePicture: currentUser?.profilePicture,
      ),
      createdAt: DateTime.now().toUtc().toString(),
    );

    if (_parentReplyComment == null) {
      setState(() {
        _post?.comments?.add(newComment);
      });
    } else {
      var commentsIndex = _post?.comments
          ?.indexWhere((element) => element.id == _parentReplyComment);

      if (commentsIndex! > -1) {
        setState(() {
          _post?.comments?[commentsIndex].comments?.add(newComment);
        });
      }
    }

    _commentController.clear();
  }

  void handleReply(Comment comment) {
    setState(() {
      _parentReplyComment = comment.id;
      _hintText = 'Reply to ${comment.author?.firstName}';
    });
    myFocusNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        visible: _isLogin,
        children: [
          SpeedDialChild(
            child: Icon(FontAwesome5.exclamation_triangle),
            label: 'report',
            onTap: () => _showMyDialog(),
          ),
          SpeedDialChild(
            child: Icon(FontAwesome5.comment),
            label: 'comment',
            onTap: () => showModalBottomSheet(
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(10.0))),
              backgroundColor: Colors.white,
              context: context,
              isScrollControlled: true,
              builder: (context) => StatefulBuilder(builder:
                  (BuildContext context,
                      StateSetter setState /*You can rename this!*/) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Stack(children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(25.0),
                          ),
                          color: Colors.black.withOpacity(0.05)),
                      child: Column(
                        children: [
                          SizedBox(height: 40),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.53,
                              child: ListView(
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                children: _post?.comments
                                        ?.map((val) => CommentItem(
                                              comment: val,
                                              isParrent: true,
                                              onDelete: () => {},
                                              onReply: () => handleReply(val),
                                            ))
                                        .toList() ??
                                    [],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(10.0),
                          ),
                          color: Colors.white),
                      child: Stack(
                        children: [
                          Center(
                            child: Text(
                              "${_post!.comments!.length} comments",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Positioned(
                            right: 10,
                            top: 10,
                            child: GestureDetector(
                              onTap: () => Navigator.of(context).pop(),
                              child: Icon(Icons.close),
                            ),
                          )
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: Container(
                          height: 60,
                          padding: EdgeInsets.only(
                              left: 10, right: 5, top: 5, bottom: 20),
                          decoration: BoxDecoration(color: Colors.white),
                          child: Row(
                            children: [
                              GFAvatar(
                                size: GFSize.SMALL,
                                backgroundImage: NetworkImage(
                                    _currentUser!.profilePicture ??
                                        'https://i.ibb.co/4Vsxhz0/2.png'),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: TextField(
                                      controller: _commentController,
                                      focusNode: myFocusNode,
                                      onSubmitted: (value) =>
                                          commentAction(value, setState),
                                      decoration: InputDecoration(
                                        hintStyle: TextStyle(fontSize: 17),
                                        hintText: _hintText,
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.only(
                                          left: 5,
                                          bottom: 15,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ]),
                );
              }),
            ),
          ),
          SpeedDialChild(
            child: Icon(
              FontAwesome5.thumbs_down,
              color: isUpvote == false ? Colors.amber : Colors.black,
            ),
            label: 'down vote',
            onTap: () => votePostAction(),
          ),
          SpeedDialChild(
            child: Icon(
              FontAwesome5.thumbs_up,
              color: isUpvote == true ? Colors.amber : Colors.black,
            ),
            label: 'up vote',
            onTap: () => votePostAction(),
          ),
          SpeedDialChild(
            child: Icon(FontAwesome5.facebook),
            onTap: () => SocialMedia(
              type: SocialType.facebook,
              urlShare: "${Endpoints.webViewUrl}/news/${_post?.slug}",
              text: _post?.summary ?? "",
            ).share(),
          ),
          SpeedDialChild(
            child: Icon(FontAwesome5.twitter),
            onTap: () => SocialMedia(
              type: SocialType.twitter,
              urlShare: "${Endpoints.webViewUrl}/news/${_post?.slug}",
              text: _post?.summary ?? "",
            ).share(),
          ),
          SpeedDialChild(
            child: Icon(FontAwesome5.linkedin),
            onTap: () => SocialMedia(
              type: SocialType.linkedin,
              urlShare: "${Endpoints.webViewUrl}/news/${_post?.slug}",
              text: _post?.summary ?? "",
            ).share(),
          )
        ],
      ),
      appBar: EmptyAppBar(),
      body: isLoading
          ? CustomProgressIndicatorWidget()
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                child: Column(
                  children: [
                    SizedBox(height: 80),
                    Container(
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => GeneralProfileSceen(
                                  userId: _post?.author?.id,
                                ),
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: GFAvatar(
                                backgroundImage: NetworkImage(
                                    _post!.author?.profilePicture ??
                                        'https://i.ibb.co/4Vsxhz0/2.png'),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: RichText(
                              text: TextSpan(
                                  text:
                                      '${_post?.author?.firstName}  ${_post?.author?.lastName}',
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
                                      text: ' ${_post?.viewCount}',
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
                                          ' ${_post?.comments == null ? 0 : _post?.comments?.length}',
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
                                          ' ${TimeAgo.timeAgoSinceDate(_post?.createdAt)}',
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
                        _post?.title ?? "",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                    ),
                    Center(
                      child: Html(
                        data: _post?.content,
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            title: Center(child: Text('Report')),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  DropdownButton(
                    hint: _dropDownValue == null
                        ? Text('Dropdown')
                        : Text(_dropDownValue!),
                    isExpanded: true,
                    iconSize: 30.0,
                    items: [
                      'Inappropriate Content',
                      'Duplicate Content',
                      'Other'
                    ].map(
                      (val) {
                        return DropdownMenuItem<String>(
                          value: val,
                          child: Text(val),
                        );
                      },
                    ).toList(),
                    onChanged: (val) {
                      setState(
                        () {
                          _dropDownValue = val.toString();
                        },
                      );
                    },
                  ),
                  TextField(
                    decoration: new InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber, width: 1),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                      ),
                      hintText: 'Description',
                    ),

                    keyboardType: TextInputType.multiline,
                    minLines: 1, //Normal textInputField will be displayed
                    maxLines: 5, // when user presses enter it will adapt to it
                  )
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Send'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
      },
    );
  }
}
