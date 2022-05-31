import 'package:boilerplate/ui/learning_journey/widget/my_course.dart';
import 'package:boilerplate/ui/learning_journey/widget/my_post.dart';
import 'package:boilerplate/ui/learning_journey/widget/my_training.dart';
import 'package:boilerplate/ui/learning_journey/widget/top_bar_learning_journey.dart';
import 'package:boilerplate/widgets/empty_app_bar_widget.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class LearningJourneyScreen extends StatefulWidget {
  @override
  _LearningJourneyScreenState createState() => _LearningJourneyScreenState();
}

class _LearningJourneyScreenState extends State<LearningJourneyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 238, 238),
      extendBodyBehindAppBar: true,
      appBar: EmptyAppBar(),
      body: ExpandableTheme(
        data: const ExpandableThemeData(
          iconColor: Colors.blue,
          useInkWell: true,
        ),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: <Widget>[
            TopbarLearningJourney(),
            MyPostWidget(),
            MyCourseWidget(),
            MyTrainingWidget()
          ],
        ),
      ),
    );
  }
}
