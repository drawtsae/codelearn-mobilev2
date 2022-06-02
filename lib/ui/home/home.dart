import 'package:boilerplate/ui/home/widget/feature_course.dart';
import 'package:boilerplate/ui/home/widget/feature_post.dart';
import 'package:boilerplate/ui/home/widget/carousel_banner.dart';
import 'package:boilerplate/widgets/progress_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomeView extends StatefulWidget {
  final PageController pageController;

  const HomeView({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _handleErrorMessage(),
        _buildMainContent(),
      ],
    );
  }

  Widget _handleErrorMessage() {
    return Observer(
      builder: (context) {
        return SizedBox.shrink();
      },
    );
  }

  Widget _buildMainContent() {
    return Observer(
      builder: (context) {
        return true == false
            ? CustomProgressIndicatorWidget()
            : Material(child: _buildHomeBody());
      },
    );
  }

  Widget _buildHomeBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          CarouselBanner(),
          FeatureCourse(
            pageController: widget.pageController,
          ),
          FeaturePost(
            pageController: widget.pageController,
          ),
        ],
      ),
    );
  }
}
