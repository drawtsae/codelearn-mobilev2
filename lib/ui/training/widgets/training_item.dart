import 'package:boilerplate/data/network/constants/endpoints.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import '../../../models/training/training.dart';
import '../../../utils/routes/routes.dart';
import '../../webview/webview.dart';
import '../training.constants.dart';

class TrainingItem extends StatefulWidget {
  final Training training;
  final bool isLogin;
  final VoidCallback loadTraining;
  const TrainingItem(
      {Key? key,
      required this.training,
      required this.isLogin,
      required this.loadTraining})
      : super(key: key);

  @override
  State<TrainingItem> createState() => _TrainingItemState();
}

class _TrainingItemState extends State<TrainingItem> {
  void _handleWebviewResult(Training training) async {
    if (widget.isLogin == false) {
      Navigator.of(context).pushNamed(Routes.login);
    } else {
      if (training.isCompleted == true) {
        CoolAlert.show(
          context: context,
          type: CoolAlertType.info,
          text: "You have already completed this lesson",
        );
      } else {
        var result = await Navigator.push(
            context,
            new MaterialPageRoute(
              builder: (BuildContext context) => new WebviewScreen(
                url:
                    "${Endpoints.webViewUrl}/training/${widget.training.slug}/mobile",
              ),
              fullscreenDialog: true,
            ));

        print(result);
        if (result == "success") {
          widget.loadTraining();
          CoolAlert.show(
            context: context,
            type: CoolAlertType.success,
            text: "Congratulations on completing this training",
          );
        }
        if (result == "false") {
          CoolAlert.show(
            context: context,
            type: CoolAlertType.error,
            text: "You were unable to complete this training",
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: GFListTile(
      avatar: GFAvatar(
          backgroundImage:
              NetworkImage(widget.training.author?.profilePicture ?? "")),
      titleText: "${widget.training.title} ${""}",
      subTitleText: widget.training.summary,
      description: Text((widget.training.tags!.map((e) => "#$e")).join(" "),
          style: TextStyle(color: LevelColors[widget.training.level])),
      icon: GFCheckbox(
        size: GFSize.SMALL,
        activeBgColor: GFColors.SUCCESS,
        value: widget.training.isCompleted!,
        onChanged: (value) => {},
      ),
      onTap: () => _handleWebviewResult(widget.training),
    ));
  }
}
