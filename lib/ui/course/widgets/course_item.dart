import 'package:boilerplate/models/course/course.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/sharedpref/shared_preference_helper.dart';
import '../../../di/components/service_locator.dart';
import '../../../utils/routes/routes.dart';
import '../../course_detail/course_detail.dart';

class CourseItem extends StatefulWidget {
  final Course course;

  const CourseItem({Key? key, required this.course}) : super(key: key);

  @override
  State<CourseItem> createState() => _CourseItemState();
}

class _CourseItemState extends State<CourseItem> {
  late SharedPreferenceHelper _sharedPreferenceHelper;

  @override
  void initState() {
    super.initState();
    _sharedPreferenceHelper =
        SharedPreferenceHelper(getIt<SharedPreferences>());
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async => await _sharedPreferenceHelper.isLoggedIn
          ? Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CourseDetailScreen(id: widget.course.id!),
              ),
            )
          : Navigator.of(context).pushNamed(Routes.login),
      child: GFCard(
        boxFit: BoxFit.cover,
        titlePosition: GFPosition.start,
        image: Image.network(
          widget.course.imageUrl.toString(),
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        showImage: true,
        title: GFListTile(
          avatar: GFAvatar(
            backgroundImage:
                NetworkImage(widget.course.author?.profilePicture ?? ""),
          ),
          titleText: widget.course.title,
          subTitleText:
              ("${widget.course.author?.firstName} ${widget.course.author?.lastName}"),
        ),
        content: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget.course.summary.toString(),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        buttonBar: GFButtonBar(
          children: <Widget>[
            GFRating(
              value: widget.course.rateScore?.toDouble() ?? 0,
              onChanged: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}
