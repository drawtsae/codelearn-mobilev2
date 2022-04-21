import 'package:boilerplate/ui/course/widgets/course_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CourseView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        _handleErrorMessage(),
        _buildMainContent(context),
      ],
    );
  }
}

Widget _handleErrorMessage() {
  return Observer(
    builder: (context) {
      //if (_postStore.errorStore.errorMessage.isNotEmpty) {
      //  return _showErrorMessage(_postStore.errorStore.errorMessage);
      //}

      return SizedBox.shrink();
    },
  );
}

Widget _buildMainContent(BuildContext context) {
  //return Observer(
  //  builder: (context) {
  //   return true == false
  //       ? CustomProgressIndicatorWidget()
  //       : Material(child: _buildHomeBody());
  // },
  //);
  return Container(
      child: ListView(
    children: [CourseItem(content: "test")],
  ));
}
