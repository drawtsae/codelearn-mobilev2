import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import '../../../models/training/training.dart';
import '../../../utils/routes/routes.dart';
import '../../webview/webview.dart';
import '../training.constants.dart';

class TrainingItem extends StatelessWidget {
  final Training training;
  final bool isLogin;
  const TrainingItem({Key? key, required this.training, required this.isLogin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: GFListTile(
      avatar: GFAvatar(
          backgroundImage: NetworkImage(training.author?.profilePicture ?? "")),
      titleText: "${training.title} ${""}",
      subTitleText: training.summary,
      description: Text("#tag1  #tag2",
          style: TextStyle(color: LevelColors[training.level])),
      icon: IconLevels[training.level],
      onTap: () => isLogin
          ? Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => WebviewScreen(
                  url:
                      "https://codelearn-trteam.netlify.app/training/${training.slug}/mobile",
                ),
              ),
            )
          : Navigator.of(context).pushNamed(Routes.login),
    ));
  }
}
