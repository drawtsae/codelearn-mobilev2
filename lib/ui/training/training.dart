import 'package:getwidget/getwidget.dart';

import '../../ui/training/widgets/training_item.dart';
import 'training.constants.dart';

import 'package:flutter/material.dart';

class TrainingView extends StatefulWidget {
  @override
  State<TrainingView> createState() => _TrainingViewState();
}

class _TrainingViewState extends State<TrainingView> {
  // int _pageName = 1;
  // int _pageSize = 20;
  // String _keySearch = '';
  // bool _hasNextPage = true;
  final _trainings = trainingBaseData;

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      _buildMainContext(context),
    ]);
  }

  Widget _buildMainContext(BuildContext context) {
    return Container(
        child: Column(
      children: [
        GFImageOverlay(
            boxFit: BoxFit.fitWidth,
            height: 100,
            image: AssetImage('assets/images/training_banner.jpeg')),
        Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) =>
                    TrainingItem(training: _trainings[index]),
                separatorBuilder: (BuildContext context, int index) =>
                    SizedBox(height: 15),
                itemCount: _trainings.length)),
      ],
    ));
  }
}
