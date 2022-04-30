import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import '../../../models/lesson/lesson.dart';
import '../training.constants.dart';

class TrainingItem extends StatelessWidget {
  final Lesson training;
  const TrainingItem({Key? key, required this.training}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: GFListTile(
      avatar: GFAvatar(),
      titleText: "${training.title} ${""}",
      subTitleText: training.summary,
      description: Text("#tag1  #tag2",
          style: TextStyle(color: LevelColors[training.level])),
      icon: IconLevels[training.level],
    ));
  }
}
