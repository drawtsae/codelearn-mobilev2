import 'package:boilerplate/models/course/course.dart';
import 'package:boilerplate/ui/course_detail/course_detail.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/sharedpref/shared_preference_helper.dart';
import '../../../di/components/service_locator.dart';
import '../../../utils/routes/routes.dart';

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
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 5,
            spreadRadius: 0,
            offset: Offset(3.0, 3.0), // shadow direction: bottom right
          )
        ],
      ),
      child: Stack(
        children: [
          Container(
            width: 220,
            height: 230,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    child: Image.network(widget.course.imageUrl.toString(),
                        height: 220, width: 220, fit: BoxFit.cover,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    }),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.network(
                                widget.course.author!.profilePicture.toString(),
                                width: 20,
                                height: 20,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              widget.course.author!.firstName.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.fade,
                            )
                          ],
                        ),
                        Text(
                          widget.course.title.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                            color: Colors.black.withOpacity(0.5),
                          ),
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 70,
            right: 20,
            child: ElevatedButton(
              onPressed: () async => await _sharedPreferenceHelper.isLoggedIn
                  ? Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            CourseDetailScreen(id: widget.course.id!),
                      ),
                    )
                  : Navigator.of(context).pushNamed(Routes.login),
              child: Text('🚀 Start'),
              style: ElevatedButton.styleFrom(
                primary: Colors.amber,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Positioned(
            top: 7,
            right: 10,
            child: Stack(
              children: [
                GFRating(
                  size: GFSize.SMALL,
                  value: widget.course.rateScore?.toDouble() ?? 0,
                  onChanged: (value) {},
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
