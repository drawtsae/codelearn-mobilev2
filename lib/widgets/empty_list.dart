import 'package:empty_widget/empty_widget.dart';
import 'package:flutter/widgets.dart';

class EmptyList extends StatelessWidget {
  final String listName;

  const EmptyList({Key? key, required this.listName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: EmptyWidget(
        image: null,
        packageImage: PackageImage.Image_1,
        title: 'Empty',
        subTitle: 'No  $listName available yet',
        titleTextStyle: TextStyle(
          fontSize: 22,
          color: Color(0xff9da9c7),
          fontWeight: FontWeight.w500,
        ),
        subtitleTextStyle: TextStyle(
          fontSize: 14,
          color: Color(0xffabb8d6),
        ),
      ),
    );
  }
}
