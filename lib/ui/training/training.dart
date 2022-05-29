import 'package:boilerplate/data/training_repository.dart';
import 'package:boilerplate/ui/training_create/training_create.screen.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttericon/font_awesome5_icons.dart';
import 'package:getwidget/getwidget.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/sharedpref/shared_preference_helper.dart';
import '../../widgets/shimmer_loading.dart';
import '../../constants/common.dart';
import '../../constants/enums.dart';
import '../../data/network/apis/training_api.dart';
import '../../di/components/service_locator.dart';
import '../../models/training/training.dart';
import '../../models/training/training_list.dart';
import '../../ui/training/widgets/training_item.dart';

import 'training.constants.dart';

class TrainingView extends StatefulWidget {
  @override
  State<TrainingView> createState() => _TrainingViewState();
}

class _TrainingViewState extends State<TrainingView> {
  late TrainingRepository _trainingRepository;
  late SharedPreferenceHelper _sharedPreferenceHelper;

  // Defines States
  bool _isLogin = false;
  bool _hasNextPage = true;
  int _pageNumber = 0;
  List<Training> _trainings = EMPTY_TRAINING_LIST;
  LoadingType _isLoading = LoadingType.None;
  String _keyword = EMPTY_STRING;
  String _trainingStatus = EMPTY_STRING;
  TextEditingController _searchField = TextEditingController();

  // Defines Actions
  Future<void> _getTrainings(
      {String keyword = EMPTY_STRING,
      String status = EMPTY_STRING,
      String level = EMPTY_STRING,
      String sortBy = TrainingSortBy.MODIFIED_DATE,
      int pageSize = DEFAULT_PAGE_SIZE,
      int pageNumber = DEFAULT_PAGE_NUMBER,
      LoadingType loadingType = LoadingType.First}) async {
    setState(() {
      _isLoading = loadingType;
      if (loadingType == LoadingType.First) _searchField.text = EMPTY_STRING;
    });

    TrainingList? response;
    await Future.delayed(
        // Whenever loading more, must have to wait 1 second to send the request
        Duration(milliseconds: loadingType == LoadingType.First ? 0 : 1000),
        () async {
      response = await _trainingRepository.getTrainings(
          keyword, status, level, sortBy, pageSize, pageNumber);
    });

    setState(() {
      _trainings = (keyword != _keyword ? EMPTY_TRAINING_LIST : _trainings) +
          response!.data!;
      _hasNextPage = response!.hasNextPage!;
      _pageNumber = pageNumber;
      _isLoading = LoadingType.None;
    });
  }

  // Defines handlers
  void handleFirstLoad() async {
    var loginStatus = await _sharedPreferenceHelper.isLoggedIn;
    setState(() {
      _isLogin = loginStatus;
    });
    await _getTrainings();
  }

  void handleLoadMore() async {
    if (_hasNextPage && _isLoading == LoadingType.None) {
      await _getTrainings(
          keyword: _keyword,
          status: _trainingStatus,
          pageNumber: _pageNumber++,
          loadingType: LoadingType.More);
    }
  }

  void handleSearch() async {
    await _getTrainings(
        keyword: _searchField.text, loadingType: LoadingType.First);
  }

  // Main
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        floatingActionButton: SpeedDial(
            animatedIcon: AnimatedIcons.menu_close,
            visible: _isLogin,
            children: [
              SpeedDialChild(
                  child: Icon(FontAwesome5.plus),
                  label: 'Create Training',
                  onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => TrainingCreateScreen(),
                        ),
                      ))
            ]),
        body: Stack(children: <Widget>[
          _buildMainContext(context),
        ]));
  }

  @override
  void initState() {
    super.initState();
    _trainingRepository = TrainingRepository(getIt<TrainingAPI>());
    _sharedPreferenceHelper =
        SharedPreferenceHelper(getIt<SharedPreferences>());
    handleFirstLoad();
  }

  Widget _buildMainContext(BuildContext context) {
    return Container(
        child: Column(
      children: [
        GFImageOverlay(
            boxFit: BoxFit.fitWidth,
            height: 90,
            image: AssetImage('assets/images/training_banner.jpeg')),
        Padding(
          padding: EdgeInsets.all(20.0),
          child: TextField(
            controller: _searchField,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Search trainings...',
                suffixIcon: IconButton(
                  onPressed: () => handleSearch(),
                  icon: Icon(Icons.search),
                )),
          ),
        ),
        Expanded(
            child: (_isLoading == LoadingType.First)
                ? ShimmerLoading()
                : LazyLoadScrollView(
                    // isLoading: _isLoading == LoadingType.More,
                    onEndOfPage: () => handleLoadMore(),
                    child: ListView.separated(
                        itemBuilder: (context, index) => TrainingItem(
                              training: _trainings[index],
                              isLogin: _isLogin,
                            ),
                        separatorBuilder: (BuildContext context, int index) =>
                            SizedBox(height: 15),
                        itemCount: _trainings.length),
                  )),
        if (_isLoading == LoadingType.More) ShimmerLoading()
      ],
    ));
  }
}
