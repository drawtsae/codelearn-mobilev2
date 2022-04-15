import 'package:another_flushbar/flushbar_helper.dart';
import 'package:boilerplate/ui/home/widget/emoji_text.dart';
import 'package:boilerplate/ui/home/widget/feature_course.dart';
import 'package:boilerplate/ui/home/widget/feature_post.dart';
import 'package:boilerplate/ui/home/widget/search_input.dart';
import 'package:boilerplate/widgets/progress_indicator_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomeView extends StatelessWidget {
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
        //if (_postStore.errorStore.errorMessage.isNotEmpty) {
        //  return _showErrorMessage(_postStore.errorStore.errorMessage);
        //}

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
          EmojiText(),
          SearchInput(),
          FeatureCourse(),
          FeaturePost(),
        ],
      ),
    );
  }

  // General Methods:-----------------------------------------------------------
  _showErrorMessage(BuildContext context, String message) {
    Future.delayed(Duration(milliseconds: 0), () {
      if (message.isNotEmpty) {
        FlushbarHelper.createError(
          message: message,
          title: "",
          duration: Duration(seconds: 3),
        )..show(context);
      }
    });

    return SizedBox.shrink();
  }
}
