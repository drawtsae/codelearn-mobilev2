import 'package:boilerplate/constants/common.dart';
import 'package:boilerplate/data/network/apis/training_api.dart';
import 'package:boilerplate/data/training_repository.dart';
import 'package:boilerplate/di/components/service_locator.dart';
import 'package:boilerplate/models/course/course.dart';
import 'package:boilerplate/models/training/training.dart';
import 'package:boilerplate/utils/extensions/time_ago.dart';

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class MyTrainingWidget extends StatefulWidget {
  @override
  _MyTrainingWidgetState createState() => _MyTrainingWidgetState();
}

class _MyTrainingWidgetState extends State<MyTrainingWidget> {
  //filter
  bool _completedFilter = true;
  bool _inCompletedFilter = true;
  bool _activeFilter = true;
  bool _pendingFilter = true;
  bool _easyFilter = true;
  bool _mediumFilter = true;
  bool _difficultFilter = true;

  bool _loading = true;

  late TrainingRepository _trainingRepository;

  List<Training> _trainingData = [];

  List<String> getLevelfilters() {
    var filter = [
      _easyFilter == true ? "Easy" : EMPTY_STRING,
      _mediumFilter == true ? "Medium" : EMPTY_STRING,
      _difficultFilter == true ? "Difficult" : EMPTY_STRING,
    ];
    return filter.where((element) => element.isNotEmpty).toList();
  }

  List<String> getSubmitfilters() {
    var filter = [
      _activeFilter == true ? "Active" : EMPTY_STRING,
      _pendingFilter == true ? "Pending" : EMPTY_STRING,
    ];
    return filter.where((element) => element.isNotEmpty).toList();
  }

  List<String> getStatusfilters() {
    var filter = [
      _completedFilter == true ? "Completed" : EMPTY_STRING,
      _inCompletedFilter == true ? "InComplete" : EMPTY_STRING,
    ];
    return filter.where((element) => element.isNotEmpty).toList();
  }

  void firstLoad() async {
    loadUserTraining();
  }

  void loadUserTraining() async {
    setState(() {
      _loading = true;
    });
    var data = await _trainingRepository.getUserTrainings(
      getStatusfilters(),
      getLevelfilters(),
      getSubmitfilters(),
    );
    setState(() {
      _trainingData = data ?? [];
      _loading = false;
    });
  }

  @override
  void initState() {
    _trainingRepository = TrainingRepository(getIt<TrainingAPI>());
    super.initState();
    firstLoad();
  }

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        child: Padding(
      padding: const EdgeInsets.all(10),
      child: ScrollOnExpand(
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: <Widget>[
              ExpandablePanel(
                theme: const ExpandableThemeData(
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  tapBodyToExpand: true,
                  hasIcon: false,
                ),
                header: Container(
                  color: Colors.amber.shade300,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        ExpandableIcon(
                          theme: const ExpandableThemeData(
                            expandIcon: Icons.arrow_right,
                            collapseIcon: Icons.arrow_drop_down,
                            iconColor: Colors.black,
                            iconSize: 28.0,
                            iconRotationAngle: 3.14 / 2,
                            iconPadding: EdgeInsets.only(right: 5),
                            hasIcon: false,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "My Trainings",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1!
                                .copyWith(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                collapsed: Container(),
                expanded: buildList(),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  buildItem(Training training) {
    return GestureDetector(
      onTap: () => {print('hit')},
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
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
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        TimeAgo.timeAgoSinceDate(training.createdAt,
                            numericDates: false),
                        style: TextStyle(fontSize: 11),
                      ),
                      Text(
                        training.title ?? '',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Container(
                        height: 32,
                        child: Text(
                          training.summary ?? '',
                          overflow: TextOverflow.clip,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                  flex: 1, child: Center(child: Text(training.level ?? ""))),
            ],
          ),
        ),
      ),
    );
  }

  buildFilter() {
    return Container(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: FilterChip(
              label: Text("Completed"),
              selected: _completedFilter,
              onSelected: (bool value) {
                setState(() {
                  _completedFilter = value;
                  loadUserTraining();
                });
              },
              selectedColor: Colors.amber.shade100,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: FilterChip(
              label: Text("Incompleted"),
              selected: _inCompletedFilter,
              onSelected: (bool value) {
                setState(() {
                  _inCompletedFilter = value;
                  loadUserTraining();
                });
              },
              selectedColor: Colors.amber.shade100,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: FilterChip(
              label: Text("Actived"),
              selected: _activeFilter,
              onSelected: (bool value) {
                setState(() {
                  _activeFilter = value;
                  loadUserTraining();
                });
              },
              selectedColor: Colors.amber.shade100,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: FilterChip(
              label: Text("Pending"),
              selected: _pendingFilter,
              onSelected: (bool value) {
                setState(() {
                  _pendingFilter = value;
                  loadUserTraining();
                });
              },
              selectedColor: Colors.amber.shade100,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: FilterChip(
              label: Text("Easy"),
              selected: _easyFilter,
              onSelected: (bool value) {
                setState(() {
                  _easyFilter = value;
                  loadUserTraining();
                });
              },
              selectedColor: Colors.amber.shade100,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: FilterChip(
              label: Text("Medium"),
              selected: _mediumFilter,
              onSelected: (bool value) {
                setState(() {
                  _mediumFilter = value;
                  loadUserTraining();
                });
              },
              selectedColor: Colors.amber.shade100,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: FilterChip(
              label: Text("Difficult"),
              selected: _difficultFilter,
              onSelected: (bool value) {
                setState(() {
                  _difficultFilter = value;
                  loadUserTraining();
                });
              },
              selectedColor: Colors.amber.shade100,
            ),
          ),
        ],
      ),
    );
  }

  buildList() {
    return Column(
      children: <Widget>[
        buildFilter(),
        _loading
            ? CircularProgressIndicator()
            : _trainingData.length == 0
                ? Center(child: Text('No training available'))
                : Column(
                    children: _trainingData
                        .map((t) => buildItem(t) as Widget)
                        .toList(),
                  )
      ],
    );
  }
}
