import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import '../../../models/training/training.dart';
import '../training.constants.dart';

class TrainingItem extends StatelessWidget {
  final Training training;
  const TrainingItem({Key? key, required this.training}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: GFListTile(
      avatar: GFAvatar(
          backgroundImage: NetworkImage(training.author?.profilePicture ?? "")),
      titleText: "${training.slug} ${""}",
      subTitleText: training.summary,
      description: Text("#tag1  #tag2",
          style: TextStyle(color: LevelColors[training.level])),
      icon: IconLevels[training.level],
    ));
  }
}
